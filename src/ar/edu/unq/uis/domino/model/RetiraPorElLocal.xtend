package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class RetiraPorElLocal extends FormaDeEnvio {
	
	static final Estado ESTADO_INICIAL = createEstadoInicial() 
		
	new(){}
	
	override getEstadoInicial() {
		return ESTADO_INICIAL
	}
	
	static def createEstadoInicial() {
		val estadoInicial = new Preparando
		estadoInicial.setSiguiente(new ListoParaRetirar)
			.setSiguiente(new Entregado)
		return estadoInicial
	}
	
}