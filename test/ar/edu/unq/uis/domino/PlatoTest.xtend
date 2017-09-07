package ar.edu.unq.uis.domino;
import org.junit.Test
import static org.junit.Assert.*


class PlatoTest {
	@Test
	def dadoUnPlatoPorcion_SeCalculaElCostoFinalSegunSuFactor() {
		val margherita = new Pizza("Margherita", 10.0)
		
		val plato = new Plato(margherita, Tamanio.PORCION)
		
		
		assertEquals(1.25, plato.getPrecio(), 0)
		
	}
}