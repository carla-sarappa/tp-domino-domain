package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date

@Accessors
@Observable

class Estado extends Entity {
	Estado siguiente
	Estado anterior
	String nombre
	
	new(){
		this.nombre = this.class.simpleName
	}
	
	override def toString(){
		getNombre()
	}
	
	def Estado setSiguiente(Estado sig) {
		this.siguiente = sig
		sig.anterior = this
		sig
	}
	
	def void update(Pedido pedido){}
		
	def Boolean getHasNext(){
		siguiente != null
	}
	
	def Boolean getHasPrevious(){
		anterior != null
	}
	
	def Boolean getAbierto(){
		true
	}
	
	override int hashCode() {
		nombre.hashCode
	}

	override boolean equals(Object obj) {
		return obj != null && getClass() == obj.getClass() && nombre.equals((obj as Estado).nombre)
	}
	
}

class Preparando extends Estado {

		
}

class ListoParaRetirar extends Estado {
	
	
	
}

class ListoParaEnviar extends Estado {
	
	
	
}

class EnViaje extends Estado {
	
	override update(Pedido pedido){
//		enviarMail()
	}	
	
}

class Entregado extends Estado {
	
	override update(Pedido pedido){
		pedido.fechaCerrado = new Date(System.currentTimeMillis)
	}
	
	override Boolean getAbierto(){
		false
	}
	
}

class Cancelado extends Estado {
	
	override Boolean getAbierto(){
		false
	}
	
}
