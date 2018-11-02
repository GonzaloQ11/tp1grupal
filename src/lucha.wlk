import Base.*
import hechizos.*

class ArmaAfilada {

	method unidadesDeLucha(personaje) = 3

	method precio(personaje) = 5 * self.unidadesDeLucha(personaje)

}

class CollarDivino {

	var property cantidadDePerlas

	constructor(_cantidadDePerlas) {
		cantidadDePerlas = _cantidadDePerlas
	}

	method unidadesDeLucha(personaje) = self.cantidadDePerlas()

	method precio(personaje) = 2 * self.cantidadDePerlas()

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

