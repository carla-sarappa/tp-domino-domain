package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Tamanio extends Entity {
	public double factor
	public String nombre
	
	new(double factor, String nombre){
		this.factor = factor
		this.nombre = nombre
	}
	
	override def toString(){
		this.nombre
	}
	
}