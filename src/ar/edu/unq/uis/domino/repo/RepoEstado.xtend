package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Estado
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoEstado extends CollectionBasedRepo<Estado> {
	
	def void createEstado(String nombre) {
		this.create(new Estado(nombre))
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	

	override protected getCriterio(Estado example) {
	}
	
}