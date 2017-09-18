package ar.edu.unq.uis.domino.model

class IngredienteDistribuido {
	String nombre
	Distribucion distribucion
	
	new(String nombre, Distribucion distribucion){
		this.nombre = nombre
		this.distribucion = distribucion
	}
}