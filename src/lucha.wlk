import Base.*
import hechizos.*
import luchaYHechiceriaEnComercio.*

class ArmaAfilada inherits Artefacto {

	method unidadesDeLucha(personaje) = 3

	method precio(personaje) = 5 * self.pesoTotal(personaje)

}

class CollarDivino inherits Artefacto {

	var property cantidadDePerlas

	constructor(_cantidadDePerlas)=super() {
		cantidadDePerlas = _cantidadDePerlas
	}

	method unidadesDeLucha(personaje) = cantidadDePerlas

	method precio(personaje) = 2 * cantidadDePerlas

	override method bonusPeso(personaje) = cantidadDePerlas * 0.5

}

class MascaraOscura inherits Artefacto {

	var property indiceDeOscuridad
	var property minimoDePoder

	constructor(_indiceDeOscuridad, _minimoDePoder)=super()  {
		indiceDeOscuridad = _indiceDeOscuridad
		minimoDePoder = _minimoDePoder
	}

	method unidadesDeLucha(personaje) {
		var valorDeLucha = fuerzaOscura.valor() * 0.5 * indiceDeOscuridad
		return valorDeLucha.max(minimoDePoder)
	}

	override method bonusPeso(personaje) {
		const pesoAgregado = self.unidadesDeLucha(personaje) - 3
		return pesoAgregado.max(0)
	}

	method precio(personaje) = indiceDeOscuridad * 10

}

