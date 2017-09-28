package ar.edu.unq.uis.domino.model

import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories
import junit.framework.TestSuite
import static org.mockito.Mockito.*

class EstadoTest extends ApplicationContextTest {
	
	@Test
	def void unPedidoConEstadoPreparandoSoloPuedeCambiarAlSiguienteOAlAnterior(){
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla Gmail")
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal(), "pedido Carla")
		
		pedido.estadoSiguiente()
		pedido.estadoSiguiente()		
		
		assertEquals("Entregado", pedido.estado.nombre)		
	}
	
	@Test
	def testCreacionEstados_estadoInicialPreparando(){
		val tipoDeEnvio = new RetiraPorElLocal()
		val estadoInicial = tipoDeEnvio.getEstadoInicial()
		
		assertEquals("Preparando", estadoInicial.nombre)
	}
	
	@Test
	def void pedidoConDelivery_PasaAEstadoEnViaje(){
		val delivery = new Delivery("calle falsa 123")
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla Gmail")
		val pedido = Repositories.pedidos.createPedido(carla, delivery, "pedido Carla")
		pedido.estadoSiguiente()
		pedido.estadoSiguiente()
		
		assertEquals("EnViaje", pedido.estado.nombre)
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
	def pedidoQuePasaAEstadoEntregadoYTiempoEsperaMasDe30Min_enviaMail() {
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
	def pedidoQuePasaAEstadoEntregadoYTiempoEsperaMenosDe30Min_noEnviaMail() {
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
	
	/**
   * Returns a <code>TestSuite</code> instance that contains all
   * the declared <code>TestCase</code> to run.
   * 
   * @return a <code>TestSuite</code> instance.
   */
//	def static final Test suite(){
//    	return new TestSuite(EstadoTest)
//	}

}

class GMailSenderMock extends GmailSender {
	new(String username, String password) {
		super(username, password)
	}
	
	override sendMail(String to, String subject, String text) { }
}  