package ar.edu.unq.uis.domino;

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.ArrayList
import java.util.List

@Accessors
class Menu {
	List<Pizza> promos = new ArrayList<Pizza>
	List<Ingrediente> extras = new ArrayList<Ingrediente>
}