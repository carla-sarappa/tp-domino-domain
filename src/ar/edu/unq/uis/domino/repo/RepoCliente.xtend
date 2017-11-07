package ar.edu.unq.uis.domino.repo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Cliente
import ar.edu.unq.uis.domino.exceptions.YaExisteUsuarioException

@Observable
@Accessors
class RepoCliente extends CollectionBasedRepo<Cliente> {
	
	def Cliente createCliente(String nick, String email, String nombre) {
		val cliente = new Cliente(nick, email, nombre)
		if (allInstances.stream.anyMatch[c | c.email == cliente.email || c.nick == cliente.nick ]){
			throw new YaExisteUsuarioException()
		} else {
			this.create(cliente)
		}
		return cliente	
	}
	
	override protected getCriterio(Cliente example) {
		return [ example.nick == it.nick ]
	}
	
	def findByNick(String nick){
		return allInstances.findFirst[it.nick == nick ]
	}
	
	def findByEmail(String email){
		return allInstances.findFirst[it.email == email ]
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		return Cliente
	}
	
}