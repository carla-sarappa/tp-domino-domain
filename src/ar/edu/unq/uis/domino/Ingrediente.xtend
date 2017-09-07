package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	String nombre
	Distribucion distribucion
	
	new(String nombre, Distribucion distribucion){
		this.nombre = nombre
		this.distribucion = distribucion
	}
}

