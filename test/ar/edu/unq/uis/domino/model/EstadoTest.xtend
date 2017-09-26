package ar.edu.unq.uis.domino.model
import static org.junit.Assert.*

import org.junit.Test

class EstadoTest {

	@Test
	def unPedidoConEstadoPreparandoSoloPuedeCambiarAlSiguienteOAlAnterior(){
		val margherita = new Pizza("Margherita", 10.0)
		val carla = new Cliente("Carla", "carla@gmail.com")
		
		val pedido = new Pedido(carla, new RetiraPorElLocal(), "pedido Carla")
		pedido.siguienteEstado()
		pedido.siguienteEstado()		
		
		assertEquals("Entregado", pedido.estado.nombre)		
	}
	
	@Test
	def testeoSettersEstado(){
		val tipoDeEnvio = new RetiraPorElLocal()
		val estadoInicial = tipoDeEnvio.getEstadoInicial()
		
		assertEquals("Preparando", estadoInicial.nombre)
	}

}