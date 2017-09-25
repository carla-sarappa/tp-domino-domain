package ar.edu.unq.uis.domino.model;
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Delivery extends FormaDeEnvio {
	String direccion
	
	final double costoEnvio = 15.0
	
	new(String dir){
		this.direccion = dir
	}
	
}