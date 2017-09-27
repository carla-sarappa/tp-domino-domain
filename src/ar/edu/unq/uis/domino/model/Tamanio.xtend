package ar.edu.unq.uis.domino.model;

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
class Tamanio extends Entity {
	public double factor
	public String nombre
	
	public final static Tamanio PORCION = new Tamanio("Porcion", 0.125)
	public final static Tamanio CHICA = new Tamanio("Chica", 0.5)
	public final static Tamanio GRANDE = new Tamanio("Grande", 1)
	public final static Tamanio FAMILIAR = new Tamanio("Familiar", 1.25)
	
	public static List<Tamanio> tamanios = #[PORCION, CHICA, GRANDE, FAMILIAR]

	new(String nombre, double factor){
		this.factor = factor
		this.nombre = nombre
	}
	
	override def toString(){
		this.nombre
	}
	
}