package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Accessors
@Observable
class Cliente extends Entity {
	String nombre
	String nick
	String password
	String email
	String direccion
	Boolean recibido = false
	
	def recibisteMail() {
		recibido
	}
	
	new(String nick, String email, String nombre){
		this.nick = nick
		this.email = email
		this.nombre = nombre
	}
}
