package ar.edu.unq.uis.domino.model;
enum TamanioJava {
	PORCION (0.125),
	CHICA (0.5),
	GRANDE (1),
	FAMILIAR (1.25);
	
	final double factor;
	
	TamanioJava(double factor){
		this.factor = factor;
	}

}