package ar.edu.unq.uis.domino;
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
