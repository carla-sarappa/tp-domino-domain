package ar.edu.unq.uis.domino.model

import java.util.List

public interface ConIngrediente {
	
	def List<IngredienteDistribuido> getIngredientes()
	def void setIngredientes(List<IngredienteDistribuido> lista)
	
}