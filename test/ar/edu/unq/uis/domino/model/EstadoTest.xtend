package ar.edu.unq.uis.domino.model

import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories
import junit.framework.TestSuite
import static org.mockito.Mockito.*
import ar.edu.unq.uis.domino.exceptions.BusinessException

class EstadoTest extends ApplicationContextTest {
	
	@Test
	def void dadoUnPedidoConEstadoPreparandoQueRetiraPorElLocal_SoloPuedeCambiarAListoParaRetirar(){
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla Gmail")
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal())
		
		pedido.estadoSiguiente()
		
		assertEquals("ListoParaRetirar", pedido.estado.nombre)		
	}
	
	@Test(expected = BusinessException)
	def void dadoUnPedidoConEstadoPreparando_debeTirarExcepcionSiSeCambiarAlEstadoAnterior(){
		val pedido = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal())
		
		pedido.estadoAnterior()
	}
	
	@Test
	def void dadoUnPedidoConTipoDeEnvioRetiraEnLocal_SoloPuedeCambiarAlSiguienteEstadoOAlAnterior(){
		val pedido = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal())
		
		pedido.estadoSiguiente()
		assertEquals("ListoParaRetirar", pedido.estado.nombre)
		pedido.estadoAnterior()
		assertEquals("Preparando", pedido.estado.nombre)
		pedido.estadoSiguiente()
		pedido.estadoSiguiente()
		assertEquals("Entregado", pedido.estado.nombre)	
	
	}
	
	@Test
	def void testCreacionEstados_estadoInicialPreparando(){
		val tipoDeEnvio = new RetiraPorElLocal()
		val estadoInicial = tipoDeEnvio.getEstadoInicial()
		
		assertEquals("Preparando", estadoInicial.nombre)
	}
	

	@Test
	def void dadoUnPedidoConDelivery_PasaAEstadoEnViaje(){
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla Gmail")
		val pedido = Repositories.pedidos.createPedido(carla, new Delivery("calle falsa 123"))
		pedido.estadoSiguiente()
		pedido.estadoSiguiente()
		
		assertEquals("EnViaje", pedido.estado.nombre)
	} 
	
	@Test
	def void dadoUnPedidoConTipoDeEnvioDelivery_SoloPuedeCambiarAlSiguienteEstadoOAlAnterior(){
		val pedido = Repositories.pedidos.createPedido(mock(Cliente), new Delivery("calle falsa 345"))
		
		pedido.estadoSiguiente()
		assertEquals("ListoParaEnviar", pedido.estado.nombre)
		pedido.estadoAnterior()
		assertEquals("Preparando", pedido.estado.nombre)
		pedido.estadoSiguiente()
		pedido.estadoSiguiente()
		assertEquals("EnViaje", pedido.estado.nombre)	
		pedido.estadoSiguiente()
		assertEquals("Entregado", pedido.estado.nombre)	
	
	}
	
	@Test
	def void pedidoQuePasaAEstadoEnViaje_enviaEmail(){
		val carla = mock(Cliente)
		val email = doReturn("carla@g.com").when(carla).email
		val pedido = mock(Pedido)
		val cliente = doReturn(carla).when(pedido).cliente
		val enViaje = new EnViaje
		
		val sender = GmailSender.instance
				
		enViaje.update(pedido)
		
		verify(sender).sendMail("carla@g.com", "Subject", "Tu pedido ya esta en viaje")
	} 
	
	@Test
	def void pedidoQuePasaAEstadoEntregadoYTiempoEsperaMasDe30Min_enviaMail() {
		val carla = mock(Cliente)
		val email = doReturn("carla@g.com").when(carla).email
		val pedido = mock(Pedido)
		doReturn(50).when(pedido).tiempoDeEspera
		val cliente = doReturn(carla).when(pedido).cliente
		val entregado = new Entregado
		
		val sender = GmailSender.instance
				
		entregado.update(pedido)
		
		verify(sender).sendMail("carla@g.com", "Subject", "Sorry por la tardanza")
	}
	
	@Test
	def void pedidoQuePasaAEstadoEntregadoYTiempoEsperaMenosDe30Min_noEnviaMail() {
		val carla = mock(Cliente)
		val email = doReturn("carla@g.com").when(carla).email
		val pedido = mock(Pedido)
		doReturn(20).when(pedido).tiempoDeEspera
		val cliente = doReturn(carla).when(pedido).cliente
		val entregado = new Entregado
		
		val sender = GmailSender.instance
				
		entregado.update(pedido)
		
		verify(sender, (never)).sendMail(any, any, any)
	}
	
	@Test(expected = BusinessException)
	def void pedidoQuePasaAEstadoEntregado_noPuedeAvanzarDeEstado(){
		val pedidoEntregado = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal)
		pedidoEntregado.estado = new Entregado()
		
		pedidoEntregado.estadoSiguiente()
	}
	
	@Test(expected = BusinessException)
	def void pedidoQuePasaAEstadoEntregado_noPuedeRetrocederDeEstado(){
		val pedidoEntregado = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal)
		pedidoEntregado.estado = new Entregado()
		
		pedidoEntregado.estadoAnterior()
	}
	
	@Test(expected = BusinessException)
	def void pedidoQuePasaAEstadoCancelado_noPuedeAvanzarDeEstado(){
		val pedidoCancelado = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal)
		pedidoCancelado.estado = new Cancelado
		
		pedidoCancelado.estadoAnterior()
	}
	
	@Test(expected = BusinessException)
	def void pedidoQuePasaAEstadoCancelado_noPuedeRetrocederDeEstado(){
		val pedidoCancelado = Repositories.pedidos.createPedido(mock(Cliente), new RetiraPorElLocal)
		pedidoCancelado.estado = new Cancelado
		
		pedidoCancelado.estadoAnterior()
	}
	

}

class GMailSenderMock extends GmailSender {
	new(String username, String password) {
		super(username, password)
	}
	
	override sendMail(String to, String subject, String text) { }
}  