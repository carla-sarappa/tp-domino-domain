package ar.edu.unq.uis.domino.model

class PizzaFactory {
	
	final static Double CUSTOM = 70.0
	
	def static construirPizzaPromo(String nombre, Double precio){
		new Pizza(nombre, precio)
	}
	
	def static construirPizzaCustom(String nombre){
		new Pizza(nombre, CUSTOM)
	}
}