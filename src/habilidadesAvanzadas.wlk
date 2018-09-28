class Armadura {

	var property valorBase
	var property refuerzo

	constructor(_valorBase, _refuerzo) {
		valorBase = _valorBase
		refuerzo = _refuerzo
	}

	method unidadesDeLucha(personaje) = self.valorBase() + self.refuerzo().unidadesDeLucha(personaje)

}

object cotaDeMalla {

	var property calidad

	method unidadesDeLucha(personaje) = self.calidad()

}

object bendicion {

	method unidadesDeLucha(personaje) = personaje.nivelDeHechiceria()

}

object hechizo {

	var property hechizo

	method unidadesDeLucha(personaje) = hechizo.poder()

}

object espejo {

	method unidadesDeLucha(personaje) = personaje.artefactos().max({ artefacto => artefacto.unidadesDeLucha(personaje) })

}

object libroDeHechizos {

	var listaDeHechizos

	method agregarHechizo(hechizo) {
		listaDeHechizos.add(hechizo)
	}

	method eliminarHechizo(hechizo) {
		listaDeHechizos.remove(hechizo)
	}

}

