package ar.edu.unq.uis.domino.model

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
class IngredienteDistribuido extends Entity {
	Ingrediente ingrediente
	Distribucion distribucion
	
	new(Ingrediente ingrediente, Distribucion distribucion){
		this.ingrediente = ingrediente
		this.distribucion = distribucion
	}
}