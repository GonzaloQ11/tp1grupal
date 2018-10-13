import hechizos.*
import lucha.*

class UserException inherits Exception {

}

class Personaje {

	const baseHechicheria
	var property hechizoPreferido
	var property baseLucha
	var property artefactos
	var property monedasDeOro

	constructor(_hechizoPreferido) {
		baseHechicheria = 3
		hechizoPreferido = _hechizoPreferido
		baseLucha = 1
		artefactos = new List()
		monedasDeOro = 100
	}

	constructor(_hechizoPreferido, _monedasDeOro) {
		baseHechicheria = 3
		hechizoPreferido = _hechizoPreferido
		baseLucha = 1
		artefactos = new List()
		monedasDeOro = _monedasDeOro
	}

	method nivelHechiceria() {
		return (baseHechicheria * hechizoPreferido.poder()) + fuerzaOscura.valor()
	}

	method esPoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	// MENSAJES LUCHA
	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}

	method eliminarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method eliminarTodosLosArtefactos() = self.artefactos().clear()

	method valorDeLucha() {
		var valorDeLucha = self.baseLucha()
		valorDeLucha += artefactos.sum({ artefacto => artefacto.unidadesDeLucha(self) })
		return valorDeLucha
	}

	method especialistaEnLucha() {
		return self.valorDeLucha() > self.nivelHechiceria()
	}

	method estaCargado() = self.artefactos().size() >= 5

	method pagarHechizo(hechizo) {
		const costo = self.monedasDeOro() - hechizo.precio(self) + (self.hechizoPreferido().precio(self) * 0.5)
		if (costo < self.monedasDeOro()) {
			self.monedasDeOro(costo)
		}
	}

	method cambioHechizo(nuevoHechizo) {
		self.pagarHechizo(nuevoHechizo)
		self.hechizoPreferido(nuevoHechizo)
	}

	method pagarArtefacto(artefacto) {
		const costo = self.monedasDeOro() - artefacto.precio(self)
		if (costo < self.monedasDeOro()) {
			self.monedasDeOro(costo)
		} else {
			throw new UserException("no hay suficiente plata")
		}
	}

	method comprarArtefacto(nuevoArtefacto) {
		self.pagarArtefacto(nuevoArtefacto)
		self.agregarArtefacto(nuevoArtefacto)
	}

}

object fuerzaOscura {

	var property valor = 5

	method eclipse() {
		valor = valor * 2
	}

}

