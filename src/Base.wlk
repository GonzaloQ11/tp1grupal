import hechizos.*
import lucha.*

class Personaje {

	var baseHechicheria
	var hechizoPreferido
	var property valorFuerzaOscura
	var property baseLucha
	var property artefactos

	constructor(_hechizoPreferido) {
		baseHechicheria = 3
		hechizoPreferido = _hechizoPreferido
		valorFuerzaOscura = 5
		baseLucha = 1
		artefactos = new List()
	}

	method nivelHechiceria() {
		return (baseHechicheria * hechizoPreferido.poder()) + valorFuerzaOscura
	}

	method eclipse() {
		valorFuerzaOscura = valorFuerzaOscura * 2
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
	
	// CAMBIAR NOMBRE
	method mayorHabilidadDeLuchaQueHechiceria() {
		return self.valorDeLucha() > self.nivelHechiceria()
	}

}

