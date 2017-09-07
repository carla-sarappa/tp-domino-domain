import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List

@Accessors
class Pedido {
	List<Plato> platos
	Cliente cliente
	Date fecha
	String aclaraciones
	Estado estado
	FormaDeEnvio formaDeEnvio
	
	def calcularMonto(){ 
		
		// TODO:
	// platos.foreach[]
	//		plato.pizzaBase.getPrecioBase() * plato.getTamanio()
	}

}