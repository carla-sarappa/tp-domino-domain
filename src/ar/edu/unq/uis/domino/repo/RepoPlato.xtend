package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.model.Tamanio
import ar.edu.unq.uis.domino.model.TamanioJava
import ar.edu.unq.uis.domino.model.Pizza

class RepoPlato extends CollectionBasedRepo<Plato> {
	
	def void createPlato(Pizza pizza, TamanioJava tamanio) {
		this.create(new Plato(pizza, tamanio))
	}
	
	override protected getCriterio(Plato example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}