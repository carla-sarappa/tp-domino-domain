package ar.edu.unq.uis.domino

import org.junit.Test
import static org.junit.Assert.*

class PizzaTest {
	
	@Test
	def dadaUnaPizzaCustomizada_suPrecioBaseEs70(){
		val pizzaCustom = PizzaFactory.construirPizzaCustom("Arielo")
		assertEquals(70.0, pizzaCustom.precioBase, 0)
	}
	
}