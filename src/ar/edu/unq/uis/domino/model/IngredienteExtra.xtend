package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteExtra extends Ingrediente {
	Distribucion distribucion
	
	
	new(String nombre, Distribucion distribucion, Double costo ) {
		super(nombre, costo)
		this.distribucion = distribucion
	}
	
	
}