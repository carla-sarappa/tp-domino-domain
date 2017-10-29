package ar.edu.unq.uis.domino.model
import org.junit.Test

import static org.junit.Assert.*
import org.junit.Before
import ar.edu.unq.uis.domino.repo.Repositories
import org.junit.After
import static org.mockito.Mockito.*


class PedidoTest extends ApplicationContextTest {

	@Test
	def dadoUnPedido_SeCalculaElCostoFinal() {
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carlagmail = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla gmail")
		
		val pedido = Repositories.pedidos.createPedido(carlagmail, new RetiraPorElLocal())
		val plato = Repositories.platos.createPlato(margherita, Tamanio.GRANDE, pedido)
				
		assertEquals(pedido.getMonto(), 10.0, 0)
		
	}
	
	@Test
	def dadoUnPedidoDePorcion_SeCalculaElCostoFinalSegunTamanio() {
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carlagmail = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla gmail")
		
		val pedido = Repositories.pedidos.createPedido(carlagmail, new RetiraPorElLocal())
		val plato = Repositories.platos.createPlato(margherita, Tamanio.PORCION, pedido)
				
		assertEquals(pedido.getMonto(), 1.25, 0)
	
	}
	
	@Test
	def dadoUnCliente_puedoObtenerSuHistorialDePedidos(){
		val cliente1 = Repositories.clientes.createCliente("cliente1", "cliente1@gmail.com", "cliente1")
		val cliente2 = Repositories.clientes.createCliente("cliente2", "cliente2@gmail.com", "cliente2")
		
		val pedido1 = Repositories.pedidos.createPedido(cliente1, new RetiraPorElLocal())
		val pedido2 = Repositories.pedidos.createPedido(cliente1, new RetiraPorElLocal())
		val pedido3 = Repositories.pedidos.createPedido(cliente1, new RetiraPorElLocal())
		
		val historialCliente1 = Repositories.pedidos.historial(cliente1)
		
		assertTrue(historialCliente1.containsAll(#[pedido1,pedido2]))
	}
	
}
