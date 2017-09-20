package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Estado extends Entity {
	public String nombre;
	
	new(String nombre){
		this.nombre = nombre;
	}
	
//	override def toString(){
//		this.nombre
//	}
//	
}