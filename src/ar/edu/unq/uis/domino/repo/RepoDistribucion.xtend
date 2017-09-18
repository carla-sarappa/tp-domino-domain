package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Distribucion

@Observable
class RepoDistribucion extends CollectionBasedRepo<Distribucion> {
	
	def void createDistribucion(String nombre) {
		this.create(new Distribucion(nombre))
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	
	override protected getCriterio(Distribucion example) {
		
	}
	
}