package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Estado extends Entity {
	Estado siguiente
	Estado anterior
	
	override def toString(){
		getNombre()
	}
	
	def Estado setSiguiente(Estado sig) {
		this.siguiente = sig
		sig.anterior = this
		sig
	}
	
	def String getNombre(){
		this.class.simpleName
	}
	
	def Boolean getHasNext(){
		siguiente != null
	}
	
	def Boolean getHasPrevious(){
		anterior != null
	}
	
}

class Preparando extends Estado {

		
}

class ListoParaRetirar extends Estado {
	
	
	
}
class ListoParaEnviar extends Estado {
	
	
	
}
class EnViaje extends Estado {
	
	
}
class Entregado extends Estado {
	
	
	
}

class Cancelado extends Estado {
	
	
	
}
