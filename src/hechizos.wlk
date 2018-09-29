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

	var property nombre
	var property amplificadorDePoder

	/*  PARTE DEL ENUNCIADO NO ENTENDIDO
	 *  "El poder de hechicería es un múltiplo de la 
	 *   cantidad de letras de su nombre, 
	 *   donde el valor por el cual se multiplica 
	 puede variar de hechizo en hechizo" */
	constructor(_nombre) {
		nombre = _nombre
	}

	method poder() {
		return self.nombre().length() * self.amplificadorDePoder()
	}

	method esPoderoso() {
		return self.poder() > 15
	}

}

object hechizoBasico {

	method poder() = 10

	method esPoderoso() = false

}

