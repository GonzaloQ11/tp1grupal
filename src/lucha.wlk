import Base.*
import hechizos.*

object espada {

	// TUVE QUE AÑADIR PERSONAJE COMO PARAMETRO
	method unidadesDeLucha(personaje) = 3

}

object hacha {

	method unidadesDeLucha(personaje) = 3

}

object lanza {

	method unidadesDeLucha(personaje) = 3

}

object collarDivino {

	var property cantidadDePerlas

	method unidadesDeLucha(personaje) = self.cantidadDePerlas()

}

object mascaraOscura {

	var property indiceDeOscuridad
	var property minimoDePoder

	method unidadesDeLucha(personaje) {
		var valorDeLucha = personaje.valorFuerzaOscura() * 0.5 * self.indiceDeOscuridad()
		if (valorDeLucha < self.minimoDePoder()) {
			return self.minimoDePoder()
		} else {
			return valorDeLucha
		}
	}

}

