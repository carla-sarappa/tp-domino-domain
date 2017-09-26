package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class RetiraPorElLocal extends FormaDeEnvio {
	
	new(){}
	
	override getEstadoInicial() {
		val estadoInicial = new Preparando
		estadoInicial.setSiguiente(new ListoParaRetirar)
			.setSiguiente(new Entregado)
		return estadoInicial
	}
	
}