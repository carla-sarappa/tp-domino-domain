package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.uis.domino.repo.RepoDistribucion
import ar.edu.unq.uis.domino.repo.Repositories
import org.junit.Before

class PlatoTest extends ApplicationContextTest {
	
	@Test
	def dadoUnPlatoPorcionRetiraEnLocal_SeCalculaElCostoFinalSegunElFactorDelTamanio() {
		val todaLaPizza = Repositories.distribuciones.createDistribucion("Toda la pizza")
		val bacon = Repositories.ingredientes.createIngrediente("Bacon", 2.0)
		val baconTodaLaPizza = new IngredienteDistribuido(bacon, todaLaPizza)
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carlagmail = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla gmail")

		val pedido = Repositories.pedidos.createPedido(carlagmail, new RetiraPorElLocal())
		val plato = Repositories.platos.createPlato(margherita, Tamanio.PORCION, pedido)
		plato.agregarExtra(baconTodaLaPizza)
		
		assertEquals(3.25, pedido.monto, 0)
	}
	
	@Test
	def dadoUnPlatoPorcionParaDelivery_SeCalculaElCostoFinalDelPedido() {
		val todaLaPizza = Repositories.distribuciones.createDistribucion("Toda la pizza")
		val bacon = Repositories.ingredientes.createIngrediente("Bacon", 2.0)
		val baconTodaLaPizza = new IngredienteDistribuido(bacon, todaLaPizza)
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carlagmail = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla gmail")

		val pedido = Repositories.pedidos.createPedido(carlagmail, new Delivery("Lebensohn 62"))
		val plato = Repositories.platos.createPlato(margherita, Tamanio.PORCION, pedido)
		plato.agregarExtra(baconTodaLaPizza)
		
		assertEquals(18.25, pedido.monto, 0)
	}
	
	@Test
	def dadoUnPedidoDePlatoTamanioFamiliar_Y_PizzaCustom_suPrecioEsDe87con50(){
		val pizzaCustom = PizzaFactory.construirPizzaCustom("Mi favorita")
		val mitadderecha = new Distribucion("Mitad derecha")
		val mitadizquierda = new Distribucion("Mitad izquierda")
		
		val provolone = new Ingrediente("Provolone", 5.0)
		val rucula = new Ingrediente("Rucula", 4.0)
		val provoloneIzq = new IngredienteDistribuido(provolone, mitadderecha)
		val ruculaDer = new IngredienteDistribuido(rucula, mitadizquierda)
		pizzaCustom.agregarIngrediente(provoloneIzq)
		pizzaCustom.agregarIngrediente(ruculaDer)
		val carlagmail = Repositories.clientes.createCliente("carlagmail", "carla@gmail.com", "Carla gmail")
		
		val pedido = Repositories.pedidos.createPedido(carlagmail, new RetiraPorElLocal())
		val plato = Repositories.platos.createPlato(pizzaCustom, Tamanio.FAMILIAR, pedido)

		
		assertEquals(87.5, pedido.monto, 0)
	}
}