package ar.edu.unq.uis.domino.repo

import ar.edu.unq.uis.domino.model.Pedido
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.unq.uis.domino.model.Cliente
import ar.edu.unq.uis.domino.model.FormaDeEnvio

class RepoPedido extends CollectionBasedRepo<Pedido> {
	
	def void createPedido(Cliente cliente, FormaDeEnvio forma, String nombre) {
		this.create(new Pedido(cliente, forma, nombre))
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		
	}
	

	override protected getCriterio(Pedido example) {
	}
	
}