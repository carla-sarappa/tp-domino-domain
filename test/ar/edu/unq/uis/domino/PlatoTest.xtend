package ar.edu.unq.uis.domino;
import org.junit.Test
import static org.junit.Assert.*


class PlatoTest {
	@Test
	def dadoUnPlatoPorcion_SeCalculaElCostoFinalSegunSuFactor() {
		val bacon = new IngredienteExtra("Bacon", Distribucion.TODA_LA_PIZZA, 2.0)
		val margherita = new Pizza("Margherita", 10.0)
		
		val plato = new Plato(margherita, Tamanio.PORCION)
		plato.agregarExtra(bacon)
				
		
		assertEquals(3.25, plato.getPrecio(), 0)
		
	}
}