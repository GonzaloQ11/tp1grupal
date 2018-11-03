import Base.*
import hechizos.*
import lucha.*
import luchaYHechiceriaEnComercio.*

class Armadura inherits Artefacto {

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

	override method pesoTotal(personaje) = super(personaje) + refuerzo.peso()

}

class CotaDeMalla {

	var property calidad

	constructor(_calidad) {
		calidad = _calidad
	}

	method unidadesDeLucha(personaje) = self.calidad()

	method precio(personaje) = 0.5 * self.unidadesDeLucha(personaje)

	method peso() = 1

}

class Bendicion {

	var property armadura

	method unidadesDeLucha(personaje) = personaje.nivelHechiceria()

	method precio(personaje) = armadura.valorBase()

	method peso() = 0

}

class RefuerzoHechizo {

	var property hechizo
	var property armadura

	constructor(_hechizo) {
		hechizo = _hechizo
	}

	method unidadesDeLucha(personaje) = hechizo.poder()

	method precio(personaje) = armadura.valorBase() + hechizo.precio(personaje)

	method peso() {
		if (hechizo.poder().even()) return 2 else return 1
	}

}

object sinRefuerzo {

	method unidadesDeLucha(personaje) = 0

	method precio(personaje) = 2

	method peso() = 0

}

object espejo inherits Artefacto{

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

