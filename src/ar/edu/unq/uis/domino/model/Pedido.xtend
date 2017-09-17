package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList

@Accessors
class Pedido {
	List<Plato> platos = new ArrayList<Plato>
	Cliente cliente
	Date fecha
	String aclaraciones
	Estado estado
	FormaDeEnvio formaDeEnvio
	
	def getMonto(){ 
		platos.map[ getPrecio() ].reduce[ a,b | a+b ]
		
	}
	
	def agregarPedido(Plato plato) {
		platos.add(plato)
	}
	
	new(Cliente cliente, FormaDeEnvio formaDeEnvio){
		this.estado = Estado.PREPARANDO
		this.formaDeEnvio = formaDeEnvio
	}

}