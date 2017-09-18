package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*


class PlatoTest {
	@Test
	def dadoUnPlatoPorcion_SeCalculaElCostoFinalSegunSuFactor() {
		val bacon = new IngredienteExtra("Bacon", DistribucionEnum.TODA_LA_PIZZA, 2.0)
		val margherita = new Pizza("Margherita", 10.0)
		
		val plato = new Plato(margherita, Tamanio.PORCION)
		plato.agregarExtra(bacon)
				
		
		assertEquals(3.25, plato.getPrecio(), 0)
	}
	
	@Test
	def dadoUnPlatoConTamanioFamiliarYPizzaCustom_suPrecioEsDe87con50(){
		val pizzaCustom = PizzaFactory.construirPizzaCustom("Pindonga")
		val provolone = new Ingrediente("Provolone", DistribucionEnum.MITAD_DERECHA)
		val rucula = new Ingrediente("Rucula", DistribucionEnum.MITAD_IZQUIERDA)
		pizzaCustom.agregarIngrediente(provolone)
		pizzaCustom.agregarIngrediente(rucula)
		
		val plato = new Plato(pizzaCustom, Tamanio.FAMILIAR)
		
		assertEquals(87.5, plato.getPrecio(), 0)
	}
}