package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*


class PlatoTest {
	@Test
	def dadoUnPlatoPorcion_SeCalculaElCostoFinalSegunSuFactor() {
		val todalapizza = new Distribucion("Toda la pizza")
		val bacon = new IngredienteExtra("Bacon", todalapizza, 2.0)
		val margherita = new Pizza("Margherita", 10.0)
		
		val plato = new Plato(margherita, Tamanio.PORCION)
		plato.agregarExtra(bacon)
				
		
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
		
		val plato = new Plato(pizzaCustom, Tamanio.FAMILIAR)
		
		assertEquals(87.5, plato.getPrecio(), 0)
	}
}