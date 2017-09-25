package ar.edu.unq.uis.domino.model;

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Ingrediente extends Entity {
	String nombre
	Double precio
	
	new(String nombre, Double precio){
		this.nombre = nombre
		this.precio = precio
	}
}

