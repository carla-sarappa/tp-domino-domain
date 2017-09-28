package ar.edu.unq.uis.domino.model
import org.junit.Test

import static org.junit.Assert.*
import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories
import org.junit.After

class PedidoTest {
	
    @Before
    def void setUp() {
    	Repositories.init
    }

	@Test
	def dadoUnPedido_SeCalculaElCostoFinal() {
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = new Cliente("Carla", "carla@gmail.com")
		
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal(), "pedido Carla")
		val plato = Repositories.platos.createPlato(margherita, Tamanio.GRANDE, pedido)
				
		assertEquals(pedido.getMonto(), 10.0, 0)
		
	}
	
	@Test
	def dadoUnPedidoDePorcion_SeCalculaElCostoFinalSegunTamanio() {
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = new Cliente("Carla", "carla@gmail.com")
		
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal(), "pedido Carla")
		val plato = Repositories.platos.createPlato(margherita, Tamanio.PORCION, pedido)
				
		assertEquals(pedido.getMonto(), 1.25, 0)
	
	}
	
}
