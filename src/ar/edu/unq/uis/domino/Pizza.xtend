package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Pizza {
	String nombre
	Double precioBase
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	
	new(String nombre, Double precio) {
		this.nombre = nombre
		this.precioBase = precio
	}
	
	def agregarIngrediente(Ingrediente ingrediente){
		ingredientes.add(ingrediente)
	}
	
}