package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import ar.edu.unq.uis.domino.exceptions.BusinessException

@Accessors
@Observable

class Estado extends Entity {
	Estado siguiente
	Estado anterior
	String nombre
	
	new(){
		this.nombre = this.class.simpleName
	}
	
	override def toString(){
		getNombre()
	}
	
	def Estado setSiguiente(Estado sig) {
		this.siguiente = sig
		sig.anterior = this
		sig
	}
	
	def void update(Pedido pedido){}
		
	def Boolean getHasNext(){
		siguiente != null
	}
	
	def Boolean getHasPrevious(){
		anterior != null
	}
	
	def Boolean getAbierto(){
		true
	}
	
	override int hashCode() {
		nombre.hashCode
	}

	override boolean equals(Object obj) {
		return obj != null && getClass() == obj.getClass() && nombre.equals((obj as Estado).nombre)
	}
	
	def cambiarEstadoSiguiente(Pedido pedido) {
		pedido.estado = this.siguiente
		this.update(pedido)
	}
	
	def cambiarEstadoAnterior(Pedido pedido) {
		pedido.estado = this.anterior
	}
	
	def cambioEstadoInvalido(){
		throw new BusinessException("El pedido se encuentra " + this.class.simpleName + " no puede cambiar a otro estado")
	}
	
}

class Preparando extends Estado {
	override cambiarEstadoAnterior(Pedido pedido){
		cambioEstadoInvalido
	}
		
}

class ListoParaRetirar extends Estado {
	
	
	
}

class ListoParaEnviar extends Estado {
	
	
	
}

class EnViaje extends Estado {
	
	override update(Pedido pedido){
		enviarMail(pedido)
	}
	
	def void enviarMail(Pedido pedido) {
		GmailSender.instance.sendMail(pedido.cliente.email, "Subject", "Tu pedido ya esta en viaje")
	}	
}

abstract class EstadoCerrado extends Estado {
	override Boolean getAbierto(){
		false
	}
	
	
	override cambiarEstadoSiguiente(Pedido pedido) {
		cambioEstadoInvalido()	
	}
	
	override cambiarEstadoAnterior(Pedido pedido) {
		cambioEstadoInvalido()
	}
	

	
}

class Entregado extends EstadoCerrado {
	
	final static int ESPERA_MAXIMA = 30
	
	override update(Pedido pedido){
		pedido.fechaCerrado = new Date(System.currentTimeMillis)
		if(pedido.tiempoDeEspera >= ESPERA_MAXIMA){
			enviarMail(pedido)
		}
	}
	
	def void enviarMail(Pedido pedido) {
		GmailSender.instance.sendMail(pedido.cliente.email, "Subject", "Sorry por la tardanza")
	}	
	
	
}

class Cancelado extends EstadoCerrado {
	
	
}
