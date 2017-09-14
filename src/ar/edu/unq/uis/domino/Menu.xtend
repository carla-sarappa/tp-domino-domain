package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Menu {
	List<Pizza> promos = new ArrayList<Pizza>
	List<Ingrediente> extras = new ArrayList<Ingrediente>
}