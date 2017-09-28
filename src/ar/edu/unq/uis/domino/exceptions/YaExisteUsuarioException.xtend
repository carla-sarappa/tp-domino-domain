package ar.edu.unq.uis.domino.exceptions

class YaExisteUsuarioException extends RuntimeException {
	new(){
		super("Ya existe usuario registrado con ese email o nick")
	}
	
}