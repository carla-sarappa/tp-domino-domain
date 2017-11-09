package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Delivery extends FormaDeEnvio {
	static final Estado ESTADO_INICIAL = createEstadoInicial()
	
	override double getCostoEnvio(){
		return 15.0
	}
	
	new(String dir){
		this.direccion = dir
	}
		
	override getEstadoInicial() {
		return ESTADO_INICIAL
	}
	
	static def createEstadoInicial() {
		val estadoInicial = new Preparando
		estadoInicial
			.setSiguiente(new ListoParaEnviar)
			.setSiguiente(new EnViaje)
			.setSiguiente(new Entregado)
		return estadoInicial
	}
	
}