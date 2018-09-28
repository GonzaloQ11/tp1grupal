object espectroMalefico {

	// Dejar poder como var?
	var property nombre = "Espectro malefico"

	method poder() {
		return self.nombre().length()
	}

	method esPoderoso() {
		return self.poder() > 15
	}

}

class Logos {

	var nombre
	var amplificadorDePoder

	/*  PARTE DEL ENUNCIADO NO ENTENDIDO
	 *  "El poder de hechicería es un múltiplo de la 
	 *   cantidad de letras de su nombre, 
	 *   donde el valor por el cual se multiplica 
	 puede variar de hechizo en hechizo" */
	method poder() {
		return self.nombre().length() * self.amplificadorDePoder()
	}

	method esPoderoso() {
		return self.poder() > 15
	}

	// GETTERS AND SETTERS
	method nombre() {
		return nombre
	}

	method nombre(_nombre) {
		nombre = _nombre
	}

	method amplificadorDePoder() {
		return amplificadorDePoder
	}

	method amplificadorDePoder(_amplificadorDePoder) {
		amplificadorDePoder = _amplificadorDePoder
	}

}

object hechizoBasico {

	method poder() = 10

	method esPoderoso() = false

}

