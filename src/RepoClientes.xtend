

import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoClientes {
	Set<Cliente> clientes = new HashSet<Cliente>
}