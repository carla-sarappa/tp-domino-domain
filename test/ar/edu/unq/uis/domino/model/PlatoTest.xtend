package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.uis.domino.repo.RepoDistribucion
import ar.edu.unq.uis.domino.repo.Repositories
import org.junit.Before

class PlatoTest {
	
	@Before
    def void setUp() {
    	Repositories.init
    }
	
	@Test
	def dadoUnPlatoPorcion_SeCalculaElCostoFinalSegunSuFactor() {
		val todaLaPizza = Repositories.distribuciones.createDistribucion("Toda la pizza")
		val bacon = Repositories.ingredientes.createIngrediente("Bacon", 2.0)
		val baconTodaLaPizza = new IngredienteDistribuido(bacon, todaLaPizza)
		val margherita = Repositories.pizzas.createPromo("Margherita", 10.0)
		val carla = new Cliente("Carla", "carla@gmail.com")
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal(), "pedido Carla")
		val plato = Repositories.platos.createPlato(margherita, Tamanio.PORCION, pedido)
		plato.agregarExtra(baconTodaLaPizza)
		
		assertEquals(3.25, plato.getPrecio(), 0)
	}
	
	@Test
	def dadoUnPlatoConTamanioFamiliarYPizzaCustom_suPrecioEsDe87con50(){
		val pizzaCustom = PizzaFactory.construirPizzaCustom("Pindonga")
		val mitadderecha = new Distribucion("Mitad derecha")
		val mitadizquierda = new Distribucion("Mitad izquierda")
		
		val provolone = new Ingrediente("Provolone", 5.0)
		val rucula = new Ingrediente("Rucula", 4.0)
		val provoloneIzq = new IngredienteDistribuido(provolone, mitadderecha)
		val ruculaDer = new IngredienteDistribuido(rucula, mitadizquierda)
		pizzaCustom.agregarIngrediente(provoloneIzq)
		pizzaCustom.agregarIngrediente(ruculaDer)
		val carla = new Cliente("Carla", "carla@gmail.com")
		
		val pedido = Repositories.pedidos.createPedido(carla, new RetiraPorElLocal(), "pedido Carla")
		val plato = new Plato(pizzaCustom, Tamanio.FAMILIAR, pedido)
		
		assertEquals(87.5, plato.getPrecio(), 0)
	}
}