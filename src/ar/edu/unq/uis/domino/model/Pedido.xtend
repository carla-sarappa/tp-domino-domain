package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pedido extends Entity {
	List<Plato> platos = new ArrayList<Plato>
	Cliente cliente
	Date fecha
	Date hora
	String aclaraciones
	Estado estado
	FormaDeEnvio formaDeEnvio
	String nombre
	
	def getMonto(){ 
		platos.map[ getPrecio() ].reduce[ a,b | a+b ]
		
	}
	
	def agregarPedido(Plato plato) {
		platos.add(plato)
	}
	
	new(Cliente cliente, FormaDeEnvio formaDeEnvio, String nombre){
		this.estado = new Estado("Preparando")
		this.formaDeEnvio = formaDeEnvio
		this.nombre = nombre
	}
	
	def getTiempoDeEspera(){
		
	}

}