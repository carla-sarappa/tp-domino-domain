package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Plato {
	Pizza pizzaBase
	Tamanio tamanio
	List<Ingrediente> ingredientesExtras
	
	new(Pizza pizza, Tamanio tamanio) {
		this.pizzaBase = pizza
		this.tamanio = tamanio
	}
	
}