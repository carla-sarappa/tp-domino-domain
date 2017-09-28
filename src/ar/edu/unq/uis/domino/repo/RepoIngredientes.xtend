package ar.edu.unq.uis.domino.repo

import ar.edu.unq.uis.domino.model.Ingrediente
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoIngredientes extends CollectionBasedRepo<Ingrediente> {
	
	def Ingrediente createIngrediente(String nombre, Double precio) {
		val ing = new Ingrediente(nombre, precio)
		this.create(ing)
		ing
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	
	override protected getCriterio(Ingrediente example) {
	}
	
}