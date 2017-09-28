package ar.edu.unq.uis.domino.exceptions

class YaExisteUsuarioException extends BusinessException {
	new(){
		super("Ya existe usuario registrado con ese email o nick")
	}
	
}