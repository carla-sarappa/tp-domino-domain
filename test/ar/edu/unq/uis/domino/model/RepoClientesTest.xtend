package ar.edu.unq.uis.domino.model
import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import ar.edu.unq.uis.domino.repo.RepoCliente
import ar.edu.unq.uis.domino.exceptions.YaExisteUsuarioException
import ar.edu.unq.uis.domino.repo.Repositories

class RepoClientesTest extends ApplicationContextTest {
	
	@Test (expected = YaExisteUsuarioException)
	def void dadoUnNickExistente_tiraExcepcionAlQuererCrearUnoConElMismoNick(){
		val nuevo = Repositories.clientes.createCliente("carla1111", "carla@gmail.com", "Carla 1111")
		val repetido = Repositories.clientes.createCliente("carla1111", "carla@gg.com", "Denise")
	}
}