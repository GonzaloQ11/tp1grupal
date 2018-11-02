import Base.*
import hechizos.*
import lucha.*

class Armadura {

	var property valorBase
	var property refuerzo

	constructor(_valorBase, _refuerzo) {
		valorBase = _valorBase
		refuerzo = _refuerzo
	}

	method unidadesDeLucha(personaje) {
		return valorBase + refuerzo.unidadesDeLucha(personaje)
	}

	method precio(personaje) = refuerzo.precio(personaje)

}

class CotaDeMalla {

	var property calidad

	constructor(_calidad) {
		calidad = _calidad
	}

	method unidadesDeLucha(personaje) = self.calidad()

	method precio(personaje) = 0.5 * self.unidadesDeLucha(personaje)

}

class Bendicion {

	var property armadura

	method unidadesDeLucha(personaje) = personaje.nivelHechiceria()

	method precio(personaje) = armadura.valorBase()

}

class RefuerzoHechizo {

	var property hechizo
	var property armadura

	constructor(_hechizo) {
		hechizo = _hechizo
	}

	method unidadesDeLucha(personaje) = hechizo.poder()

	method precio(personaje) = armadura.valorBase() + hechizo.precio(personaje)

}

object sinRefuerzo {

	method unidadesDeLucha(personaje) = 0

	method precio(personaje) = 2

}

object espejo {

	method artefactosSinEspejo(personaje) = personaje.artefactos().filter({ artefacto => artefacto != self })

	method maximoObjeto(personaje) = self.artefactosSinEspejo(personaje).max({ artefacto => artefacto.unidadesDeLucha(personaje) })

	method unidadesDeLucha(personaje) = self.maximoObjeto(personaje).unidadesDeLucha(personaje)

	method precio(personaje) = 90

}

object libroDeHechizos {

	var property hechizos = new List()

	method agregarHechizo(hechizo) {
		hechizos.add(hechizo)
	}

	method eliminarHechizo(hechizo) {
		hechizos.remove(hechizo)
	}

	method poder() {
		var hechizosPoderosos = hechizos.filter({ hechizo => hechizo.esPoderoso() })
		return hechizosPoderosos.sum({ hechizo => hechizo.poder() })
	}

	method precio(personaje) {
		return (10 * self.hechizos().size()) + self.poder()
	}

}

