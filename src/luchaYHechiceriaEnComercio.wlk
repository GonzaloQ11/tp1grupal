import Base.*
import hechizos.*
import lucha.*
import habilidadesAvanzadas.*

class HechizoComercial inherits Logos {

	var property porcentaje

	constructor() = super("el hechizo comercial", 2) {
		porcentaje = 20
	}

	override method poder() = super() * (porcentaje / 100)

}

class Artefacto {

	var property peso
	var property diasComprado

	method pesoTotal(personaje) {
		return peso - self.desgaste()
	}

	// consulta abstraccion diasComprado
	/*
	 *  const diaDeCompra
	 *  const hoy = new Date()
	 *  method diasComprado() = hoy - diaDeCompra
	 */
	method desgaste() {
		const desgaste = diasComprado / 1000
		if (desgaste > 1) {
			return 1
		} else {
			return desgaste
		}
	}
	
	method cargarPesoYDiasComprado(_peso,_diasComprado){
		peso =_peso
		diasComprado =_diasComprado
	}

}

class NPC inherits Personaje {

	var property dificultad

	override method valorDeLucha() = super() * dificultad.bonus()

}

object facil {

	method bonus() = 1

}

object moderado {

	method bonus() = 2

}

object dificil {

	method bonus() = 4

}

class Comerciante {

	var property situacionImpositiva

	method recategorizacionCompulsiva() {
		self.situacionImpositiva(self.situacionImpositiva().cambio())
	}

}

object independiente {

	var property comision

	method aumento() = comision

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

	method aumento() = 21

	method cambio() = impuestoGanancias

}
// ni idea
object impuestoGanancias {

	method cambio() = self

}

