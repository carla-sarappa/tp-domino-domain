package ar.edu.unq.uis.domino.model;

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
abstract class FormaDeEnvio {
	String direccion
		
	def double getCostoEnvio(){
		return 0.0
	}
	
	abstract def Estado getEstadoInicial()
	
	def List<Estado> getEstadosPosibles(){
		val estados = new ArrayList<Estado>()
		var estadoInicial = getEstadoInicial()
		
		while (estadoInicial != null){
			estados.add(estadoInicial)
			estadoInicial = estadoInicial.siguiente
		}		
		estados.add(new Cancelado())
		return estados
	}
	

	
	
}

