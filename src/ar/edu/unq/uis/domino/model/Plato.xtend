package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.annotations.Dependencies

@TransactionalAndObservable
@Accessors
class Plato extends Entity {
	Pizza pizzaBase
	Tamanio tamanio
	List<IngredienteExtra> ingredientesExtras = new ArrayList<IngredienteExtra>
	
	
	new(){}
	
	new(Pizza pizza, Tamanio tamanio) {
		this.pizzaBase = pizza
		this.tamanio = tamanio
	}
	
	def agregarExtra(IngredienteExtra i){
		ingredientesExtras.add(i)
	}
	
	@Dependencies("platos")
	def getPrecio(){
		(pizzaBase.getPrecio() * tamanio.factor) + calcularExtras()
	}
	
	def calcularExtras(){
		if (ingredientesExtras.size == 0) {
			return 0
		} else {
			ingredientesExtras.map[ getPrecio() ].reduce[ a,b | a+b ]
			
		}
	}
}