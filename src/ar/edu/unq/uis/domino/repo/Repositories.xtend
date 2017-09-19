package ar.edu.unq.uis.domino.repo

import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.model.Pizza
import ar.edu.unq.uis.domino.model.Ingrediente
import ar.edu.unq.uis.domino.model.Distribucion

class Repositories {
	
	static def RepoPizza getPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
	}
	
	static def RepoIngredientes getIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
	}
	
	static def RepoDistribucion getDistribuciones(){
		ApplicationContext.instance.getSingleton(typeof(Distribucion)) as RepoDistribucion
	}
	
}