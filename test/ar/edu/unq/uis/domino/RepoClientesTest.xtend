package ar.edu.unq.uis.domino
import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class RepoClientesTest {
	
	@Test (expected = RuntimeException)
	def void dadoUnNickExistente_tiraExcepcionAlQuererCrearUnoConElMismoNick(){
		val carla = new Cliente("carla11", "carla@gmail.com")
		val repoClientes = RepoClientes.getInstance()
		repoClientes.nuevoCliente(carla)
		val carla112 = new Cliente("carla11", "carla@gg.com")
		repoClientes.nuevoCliente(carla112)
	}
}