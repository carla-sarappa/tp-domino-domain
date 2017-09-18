package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteExtra extends Ingrediente {
	Double costo
	Distribucion distribucion
	
	
	new(String nombre, Distribucion distribucion, Double costo ) {
		super(nombre)
		this.distribucion = distribucion
		this.costo = costo
	}
	
	
}