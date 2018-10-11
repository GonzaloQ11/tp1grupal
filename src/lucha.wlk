import Base.*
import hechizos.*

object armasAfiladas {

	method unidadesDeLucha(personaje) = 3

}

object espada {

	method unidadesDeLucha(personaje) = armasAfiladas.unidadesDeLucha(personaje)

}

object hacha {

	method unidadesDeLucha(personaje) = armasAfiladas.unidadesDeLucha(personaje)

}

object lanza {

	method unidadesDeLucha(personaje) = armasAfiladas.unidadesDeLucha(personaje)

}

class CollarDivino {

	var property cantidadDePerlas

	constructor(_cantidadDePerlas) {
		cantidadDePerlas = _cantidadDePerlas
	}

	method unidadesDeLucha(personaje) = self.cantidadDePerlas()

}

class MascaraOscura {

	var property indiceDeOscuridad
	var property minimoDePoder

	constructor(_indiceDeOscuridad, _minimoDePoder) {
		indiceDeOscuridad = _indiceDeOscuridad
		minimoDePoder = _minimoDePoder
	}

	method unidadesDeLucha(personaje) {
		var valorDeLucha = fuerzaOscura.valor() * 0.5 * self.indiceDeOscuridad()
		if (valorDeLucha < self.minimoDePoder()) {
			return self.minimoDePoder()
		} else {
			return valorDeLucha
		}
	}

}

