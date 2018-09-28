object espada {

	method unidadesDeLucha() = 3

}

object hacha {

	method unidadesDeLucha() = 3

}

object lanza {

	method unidadesDeLucha() = 3

}

class CollarDivino {

	var cantidadDePerlas

	method unidadesDeLucha() = self.cantidadDePerlas()

	// GETTER AND SETTER
	method cantidadDePerlas() {
		return cantidadDePerlas
	}

	method cantidadDePerlas(_nuevaCantidad) {
		cantidadDePerlas = _nuevaCantidad
	}

}

class MascarasOscuras {

	var indiceDeOscuridad

	method unidadesDeLucha(personaje) {
		var valorDeLucha = personaje.valorFuerzaOscura() * self.indiceDeOscuridad()
		if (valorDeLucha < 4) {
			return 4
		} else {
			return valorDeLucha
		}
	}

	// GETTER AND SETTER
	method indiceDeOscuridad() {
		return indiceDeOscuridad
	}

	method indiceDeOscuridad(_indiceDeOscuridad) {
		indiceDeOscuridad = _indiceDeOscuridad
	}

}

