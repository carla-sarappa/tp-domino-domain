package ar.edu.unq.uis.domino;
import org.junit.Test

import static org.junit.Assert.*
import org.junit.Before

class PedidoTest {
	
    @Before
    def void setUp() {
    	
	
    }

	@Test
	def dadoUnPedido_SeCalculaElCostoFinal() {
		val margherita = new Pizza("Margherita", 10.0)
		
		val pedido = new Pedido
		val plato = new Plato(margherita, Tamanio.GRANDE)
		
		pedido.agregarPedido(plato)
		
		assertEquals(pedido.calcularMonto(), 10.0, 0)
		
	}
	
	@Test
	def dadoUnPedidoDePorcion_SeCalculaElCostoFinalSegunTamanio() {
		val margherita = new Pizza("Margherita", 10.0)
		
		val pedido = new Pedido
		val plato = new Plato(margherita, Tamanio.PORCION)
		
		pedido.agregarPedido(plato)
		
		assertEquals(pedido.calcularMonto(), 1.25, 0)
		
	}
}
