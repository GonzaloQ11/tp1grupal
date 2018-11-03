import Base.*
import hechizos.*
import luchaYHechiceriaEnComercio.*

class ArmaAfilada inherits Artefacto{

	method unidadesDeLucha(personaje) = 3

	method precio(personaje) = 5 * self.pesoTotal(personaje)

}

class CollarDivino inherits Artefacto{

	var property cantidadDePerlas

	constructor(_cantidadDePerlas) {
		cantidadDePerlas = _cantidadDePerlas
	}

	method unidadesDeLucha(personaje) = self.cantidadDePerlas()

	method precio(personaje) = 2 * self.cantidadDePerlas()
	
	override method pesoTotal(personaje)= super(personaje) + cantidadDePerlas*0.5
}

class MascaraOscura inherits Artefacto{

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
	
	override method pesoTotal(personaje){
		const pesoAgregado = self.unidadesDeLucha(personaje)-3
		if (pesoAgregado>0){
			return super(personaje) + pesoAgregado
		}
		else{
			return super(personaje)
		}
	} 
	
	method precio(personaje) =self.indiceDeOscuridad()*10
}


