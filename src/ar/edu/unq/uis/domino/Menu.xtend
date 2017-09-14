package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.uis.domino.repo.RepoPizza

@Accessors
@Observable
class Menu {
	//List<Pizza> promos = new ArrayList<Pizza>
	List<Ingrediente> extras = new ArrayList<Ingrediente>
	
	def getPromos(){
		(ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza).allInstances
	}
	
}