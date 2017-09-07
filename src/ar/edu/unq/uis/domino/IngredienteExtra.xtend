package ar.edu.unq.uis.domino
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteExtra extends Ingrediente {
	Double costo
	
	
	new(String nombre, Distribucion distribucion, Double costo ) {
		super(nombre, distribucion)
		this.costo = costo
	}
	
	
}