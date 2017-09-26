package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Delivery extends FormaDeEnvio {
	String direccion
	
	final double costoEnvio = 15.0
	
	new(String dir){
		this.direccion = dir
	}
		
	override getEstadoInicial() {
		return new Preparando()
			.setSiguiente(new ListoParaEnviar)
			.setSiguiente(new EnViaje)
			.setSiguiente(new Entregado)
	}
	
}