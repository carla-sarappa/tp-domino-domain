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
	Pedido pedido
	
	new(){}
	
	new(Pizza pizza, Tamanio tamanio, Pedido pedido) {
		this.pizzaBase = pizza
		this.tamanio = tamanio
		this.pedido = pedido
	}
	
	def agregarExtra(IngredienteExtra i){
		ingredientesExtras.add(i)
	}
	
	@Dependencies("pizzaBase", "tamanio", "ingredientesExtras")
	def getPrecio(){
		
		(pizzaBase.precio * tamanio.factor) + calcularExtras()
	}
	
	def calcularExtras(){
		if (ingredientesExtras.size == 0) {
			return 0.0
		} else {
			ingredientesExtras.map[ getPrecio() ].fold(0.0)[ a,b | a+b ]
			
		}
	}
}