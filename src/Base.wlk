import hechizos.*
import lucha.*

class Personaje {

	var baseHechicheria
	var hechizoPreferido
	var valorFuerzaOscura
	var baseLucha
	var artefactos

	constructor(_hechizoPreferido){
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

	method mayorHabilidadDeLuchaQueHechiceria() {
		return self.valorDeLucha() > self.nivelHechiceria()
	}

	// ME QUEDE ACA
	method valorDeLucha() {
		var valorDeLucha = self.baseLucha()
		artefactos.forEach()
		return valorDeLucha
	}

	// GETTER AND SETTER
	method baseLucha() {
		return baseLucha
	}

	method baseLucha(_baseLucha) {
		baseLucha = _baseLucha
	}

}

