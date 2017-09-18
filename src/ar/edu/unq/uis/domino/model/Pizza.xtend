package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Pizza extends Entity {
	String nombre
	Double precioBase
	List<IngredienteDistribuido> ingredientes = new ArrayList<IngredienteDistribuido>
	
	new(String nombre, Double precio) {
		this.nombre = nombre
		this.precioBase = precio
	}
	
	new(){}
	
	def agregarIngrediente(IngredienteDistribuido ingrediente){
		ingredientes.add(ingrediente)
	}
	
}