import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Delivery extends FormaDeEnvio {
	String direccion
	
	new(String dir){
		this.direccion = dir
	}
	
}