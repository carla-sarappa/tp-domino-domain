package ar.edu.unq.uis.domino.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.annotations.Dependencies
import ar.edu.unq.uis.domino.repo.Repositories

@Accessors
@TransactionalAndObservable
class Pedido extends Entity implements Cloneable {
	Cliente cliente
	Date fecha
	Date fechaCerrado
	String aclaraciones
	Estado estado
	FormaDeEnvio formaDeEnvio
	
	@Dependencies("platos")
	def getMonto(){ 
		val subtotal = getPlatos.map[ getPrecio() ].fold(0.0)[ a,b | a+b ]
		subtotal + formaDeEnvio.getCostoEnvio()
	}
	
	def getPlatos() {
		Repositories.getPlatos().allInstances.filter[ pedido == this].toList
	}
	
	new(Cliente cliente, FormaDeEnvio formaDeEnvio){
		this.estado = formaDeEnvio.estadoInicial
		this.formaDeEnvio = formaDeEnvio
		this.cliente = cliente
		this.fecha = new Date(System.currentTimeMillis)
	}
	
	def estadoSiguiente(){
		estado.cambiarEstadoSiguiente(this)
	}
	
	def estadoAnterior(){
		estado.cambiarEstadoAnterior(this)
	}
	
	def cancelar(){
		this.estado = new Cancelado()
	}
	
	def getTiempoDeEspera(){
		if (fechaCerrado == null || fecha == null) return null
		return ((fechaCerrado.time - fecha.time) / (60*1000)).intValue
	}
	
	def getNombre(){
		return "Pedido " + id
	}

}