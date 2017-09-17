package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class RepoClientes {
    private static final RepoClientes INSTANCE = new RepoClientes()
    List<Cliente> clientes = new ArrayList<Cliente>
    

    private new() {
        if (INSTANCE != null) {
            throw new IllegalStateException("Already instantiated")
        }
    }

    def static RepoClientes getInstance() {
        return INSTANCE
    }
	
	
	def nuevoCliente(Cliente cliente){
		if (clientes.stream.anyMatch[c | c.email == cliente.email || c.nick == cliente.nick ]){
			throw new RuntimeException("Ya existe usuario registrado con ese email o nick")
		}
		clientes.add(cliente)
	}
	
	def clear(){
		clientes = new ArrayList<Cliente>
	}
}