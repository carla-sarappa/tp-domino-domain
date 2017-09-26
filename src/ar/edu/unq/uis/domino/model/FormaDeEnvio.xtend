package ar.edu.unq.uis.domino.model;

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable

@Observable
abstract class FormaDeEnvio {
	
	abstract def Estado getEstadoInicial()
	
	def List<Estado> estadosPosibles(){
		val estados = new ArrayList<Estado>()
		var estadoInicial = getEstadoInicial()
		
		while (estadoInicial != null){
			estados.add(estadoInicial)
			estadoInicial = estadoInicial.siguiente
		}		
				
		return estados
	}
	
}

