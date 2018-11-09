import Base.*
import hechizos.*
import lucha.*
import habilidadesAvanzadas.*
import luchaYHechiceriaEnComercio.*

class HechizoComercial inherits Logos {

	var property porcentaje

	constructor() = super("el hechizo comercial", 2) {
		porcentaje = 20
	}

	override method poder() = super() * (porcentaje / 100)

}

class Artefacto {

	var property peso = 1
	var property diaDeCompra = new Date()

	constructor() {
		peso = 1
		diaDeCompra = new Date()
	}

	method diasComprado() = new Date() - diaDeCompra

	method desgaste() {
		var desgaste = self.diasComprado() / 1000
		return desgaste.min(1)
	}

	method bonusPeso(personaje) = 0

	method pesoTotal(personaje) = peso - self.desgaste() + self.bonusPeso(personaje)

	method cargarPesoYDiasComprado(_peso, _diasComprado) {
		peso = _peso
		diaDeCompra = _diasComprado
	}

}

class NPC inherits Personaje {

	var property dificultad

	override method valorDeLucha() = super() * dificultad.incremento()

}

class Nivel {

	method incremento() = 2 ** self.bonus()

}

object facil inherits Nivel {

	method bonus() = 0

}

object moderado inherits Nivel {

	method bonus() = 1

}

object dificil inherits Nivel {

	method bonus() = 2

}

class Comerciante {

	var property situacionImpositiva

	constructor(_situacionImpositiva) {
		situacionImpositiva = _situacionImpositiva
	}

	method venderArtefacto(artefacto,personaje) {
		return artefacto.precio(personaje) + (self.situacionImpositiva().aumento(artefacto,personaje)/100)
	}

	method recategorizacionCompulsiva() = self.situacionImpositiva(self.situacionImpositiva().cambio())

}

class Independiente {

	var property comision
	
	constructor (_comision){
		comision = _comision
	}
	
	method aumento(artefacto,personaje) =  artefacto.precio(personaje) * comision

	method cambio() {
		if (self.comision() * 2 > 21) {
			return registrado
		} else {
			self.comision(self.comision() * 2)
			return self
		}
	}

}

object registrado {

	method aumento(artefacto,personaje) = artefacto.precio(personaje) * 21

	method cambio() = impuestoGanancias

}

object impuestoGanancias {

	method aumento(artefacto,personaje) {
		if (artefacto.precio(personaje) < impuestoMinimoNoImponible.valor()) {
			return 0
		} else {
			return (artefacto.precio(personaje) - impuestoMinimoNoImponible.valor()) * 35
		}
	}

	method cambio() = self

}

object impuestoMinimoNoImponible {

	var property valor = 30

}

