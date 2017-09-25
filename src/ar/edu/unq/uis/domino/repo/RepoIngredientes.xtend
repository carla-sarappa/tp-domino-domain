package ar.edu.unq.uis.domino.repo

import ar.edu.unq.uis.domino.model.Ingrediente
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoIngredientes extends CollectionBasedRepo<Ingrediente> {
	
	def void createIngrediente(String nombre, Double precio) {
		this.create(new Ingrediente(nombre, precio))
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	
	override protected getCriterio(Ingrediente example) {
	}
	
}