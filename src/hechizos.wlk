class Logos {

	var property nombre
	var property amplificadorDePoder

	constructor(_nombre) {
		nombre = _nombre
		amplificadorDePoder = 1
	}

	constructor(_nombre, _amplificadorDePoder) {
		nombre = _nombre
		amplificadorDePoder = _amplificadorDePoder
	}

	method poder() = self.nombre().length() * self.amplificadorDePoder()

	method esPoderoso() = self.poder() > 15

	method precio(personaje) = self.poder()

}

object hechizoBasico {

	method poder() = 10

	method esPoderoso() = false

	method precio(personaje) = self.poder()

}


