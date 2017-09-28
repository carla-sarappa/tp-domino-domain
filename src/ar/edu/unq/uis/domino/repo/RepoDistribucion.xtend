package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Distribucion

@Observable
class RepoDistribucion extends CollectionBasedRepo<Distribucion> {
	
	def Distribucion createDistribucion(String nombre) {
		val dist = new Distribucion(nombre)
		this.create(dist)
		dist
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	
	override protected getCriterio(Distribucion example) {
		
	}
	
}