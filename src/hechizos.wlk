class Logos {

	var property nombre
	var property amplificadorDePoder

	constructor(_nombre) {
		nombre = _nombre
		amplificadorDePoder = 1
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

