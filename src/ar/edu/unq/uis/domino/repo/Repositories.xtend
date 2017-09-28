package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Distribucion
import ar.edu.unq.uis.domino.model.Estado
import ar.edu.unq.uis.domino.model.Pedido
import ar.edu.unq.uis.domino.model.Plato
import ar.edu.unq.uis.domino.model.Cliente

public class Repositories {
	
	static def RepoPizza getPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
	
	static def RepoIngredientes getIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
	}
	
	static def RepoDistribucion getDistribuciones(){
		ApplicationContext.instance.getSingleton(typeof(Distribucion)) as RepoDistribucion
	}
	
	static def RepoPedido getPedidos(){
		ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
	}
	
	static def RepoPlato getPlatos(){
		ApplicationContext.instance.getSingleton(typeof(Plato)) as RepoPlato
	}
	
	static def RepoCliente getClientes(){
		ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoCliente
	}
	
	static def init(){
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Distribucion), new RepoDistribucion)
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedido)
		ApplicationContext.instance.configureSingleton(typeof(Plato), new RepoPlato)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoCliente)
	}
	

}