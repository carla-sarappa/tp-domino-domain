package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Pizza extends Entity implements Cloneable, ConIngrediente {
	String nombre
	Double precio
	List<IngredienteDistribuido> ingredientes = new ArrayList<IngredienteDistribuido>
	
	new(String nombre, Double precio) {
		this.nombre = nombre
		this.precio = precio
	}
	
	new(){}
	
	def agregarIngrediente(IngredienteDistribuido ingrediente){
		ingredientes.add(ingrediente)
	}
	
}