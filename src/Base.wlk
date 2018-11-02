import hechizos.*
import lucha.*

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

	method nivelHechiceria() {
		return (baseHechicheria * hechizoPreferido.poder()) + fuerzaOscura.valor()
	}

	method esPoderoso() = hechizoPreferido.esPoderoso()

	// MENSAJES LUCHA
	method agregarArtefacto(artefacto) = artefactos.add(artefacto)

	method eliminarArtefacto(artefacto) = artefactos.remove(artefacto)

	method eliminarTodosLosArtefactos() = self.artefactos().clear()

	method valorDeLucha() {
		var valorDeArtefactos = artefactos.sum({ artefacto => artefacto.unidadesDeLucha(self) })
		return self.baseLucha() + valorDeArtefactos
	}

	method especialistaEnLucha() = self.valorDeLucha() > self.nivelHechiceria()

	method estaCargado() = self.artefactos().size() >= 5

	method descuentoHechizo() = self.hechizoPreferido().precio(self) * 0.5

	method pagarItem(item, descuento) {
		const precioConDescuento = item.precio(self) - descuento
		if (precioConDescuento > self.monedasDeOro()) {
			throw new UserException("No hay suficientes monedas")
		}
		const resultadoMonedas = self.monedasDeOro() - precioConDescuento
		if (resultadoMonedas < self.monedasDeOro()) {
			self.monedasDeOro(resultadoMonedas)
		}
	}

	method cambioHechizo(nuevoHechizo) {
		self.pagarItem(nuevoHechizo,self.descuentoHechizo())
		self.hechizoPreferido(nuevoHechizo)
	}

	method comprarArtefacto(nuevoArtefacto) {
		self.pagarItem(nuevoArtefacto,0)
		self.agregarArtefacto(nuevoArtefacto)
	}

}

object fuerzaOscura {

	var property valor = 5

	method eclipse() {
		valor = valor * 2
	}

}

class UserException inherits Exception {

}

