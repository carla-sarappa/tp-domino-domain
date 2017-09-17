package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class RepoClientesTest {
	
	@Test (expected = RuntimeException)
	def void dadoUnNickExistente_tiraExcepcionAlQuererCrearUnoConElMismoNick(){
		val nuevo = new Cliente("Carla", "carla@gmail.com")
		val repoClientes = RepoClientes.getInstance()
		repoClientes.nuevoCliente(nuevo)
		val repetido = new Cliente("Carla", "carla@gg.com")
		repoClientes.nuevoCliente(repetido)
	}
}