package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Cliente {
	String nombre
	String nick
	String password
	String email
	String direccion
	
	new(String nick, String email){
		this.nick = nick
		this.email = email
	}
}
