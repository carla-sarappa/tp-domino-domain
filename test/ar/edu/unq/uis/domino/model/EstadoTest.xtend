package ar.edu.unq.uis.domino.model
import static org.junit.Assert.*

import org.junit.Test
import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories

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
	def void pedidoQuePasaAEstadoEnViaje_enviaEmail(){
		
	} 

}