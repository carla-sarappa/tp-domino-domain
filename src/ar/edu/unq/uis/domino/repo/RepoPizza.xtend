package ar.edu.unq.uis.domino.repo


import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.uis.domino.Pizza

import ar.edu.unq.uis.domino.PizzaFactory

@Observable
class RepoPizza extends CollectionBasedRepo<Pizza> {
	def void createCustom(String nombre) {
		this.create(PizzaFactory.construirPizzaCustom(nombre))
	}
	def void createPromo(String nombre,Double precio) {
		this.create(PizzaFactory.construirPizzaPromo(nombre,precio))
	}
	override protected getCriterio(Pizza arg0) {
		
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	
}