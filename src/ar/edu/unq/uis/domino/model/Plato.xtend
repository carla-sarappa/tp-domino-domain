package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Observable
@Accessors
class Plato extends Entity {
	Pizza pizzaBase
	TamanioJava tamanio
	List<IngredienteExtra> ingredientesExtras = new ArrayList<IngredienteExtra>
	
	
	new(){}
	
	new(Pizza pizza, TamanioJava tamanio) {
		this.pizzaBase = pizza
		this.tamanio = tamanio
	}
	
	def agregarExtra(IngredienteExtra i){
		ingredientesExtras.add(i)
	}
	
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