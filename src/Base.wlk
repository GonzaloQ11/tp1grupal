import hechizos.*
import lucha.*

class Personaje {

	const baseHechicheria
	var hechizoPreferido
	var property baseLucha
	var property artefactos

	constructor(_hechizoPreferido) {
		baseHechicheria = 3
		hechizoPreferido = _hechizoPreferido
		baseLucha = 1
		artefactos = new List()
	}

	method nivelHechiceria() {
		return (baseHechicheria * hechizoPreferido.poder()) + fuerzaOscura.valor()
	}

	method esPoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	// SETTER
	method hechizoPreferido(hechizo) {
		hechizoPreferido = hechizo
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

}

object fuerzaOscura {

	var property valor = 5

	method eclipse() {
		valor = valor * 2
	}

}

