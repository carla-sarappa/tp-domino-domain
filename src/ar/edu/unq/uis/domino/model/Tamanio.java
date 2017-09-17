package ar.edu.unq.uis.domino.model;
enum Tamanio {
	PORCION (0.125),
	CHICA (0.5),
	GRANDE (1),
	FAMILIAR (1.25);
	
	final double factor;
	
	Tamanio(double factor){
		this.factor = factor;
	}

}