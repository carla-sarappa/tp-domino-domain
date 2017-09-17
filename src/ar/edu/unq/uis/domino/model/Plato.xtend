package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Plato {
	Pizza pizzaBase
	Tamanio tamanio
	List<IngredienteExtra> ingredientesExtras = new ArrayList<IngredienteExtra>
	
	new(Pizza pizza, Tamanio tamanio) {
		this.pizzaBase = pizza
		this.tamanio = tamanio
	}
	
	def agregarExtra(IngredienteExtra i){
		ingredientesExtras.add(i)
	}
	
	def getPrecio(){
		(pizzaBase.getPrecioBase() * tamanio.factor) + calcularExtras()
	}
	
	def calcularExtras(){
		if (ingredientesExtras.size == 0) {
			return 0
		} else {
			ingredientesExtras.map[ getCosto() ].reduce[ a,b | a+b ]
			
		}
	}
}