package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.model.Tamanio
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Pedido

class RepoPlato extends CollectionBasedRepo<Plato> {
	
	def Plato createPlato(Pizza pizza, Tamanio tamanio, Pedido pedido) {
		val plato = new Plato(pizza, tamanio, pedido)
		this.create(plato)
		plato
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