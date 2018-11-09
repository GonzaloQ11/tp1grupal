import hechizos.*
import lucha.*
import habilidadesAvanzadas.*
import luchaYHechiceriaEnComercio.*

class Personaje {

	const baseHechicheria
	var property hechizoPreferido
	var property baseLucha
	var property artefactos
	var property monedasDeOro
	const cargaMaxima

	constructor(_hechizoPreferido, _cargaMaxima) {
		baseHechicheria = 3
		hechizoPreferido = _hechizoPreferido
		baseLucha = 1
		artefactos = new List()
		monedasDeOro = 100
		cargaMaxima = _cargaMaxima
	}

	method nivelHechiceria() = baseHechicheria * hechizoPreferido.poder() + fuerzaOscura.valor()

	method esPoderoso() = hechizoPreferido.esPoderoso()

	method agregarArtefacto(artefacto) {
		if (artefacto.pesoTotal(self) < self.pesoRestanteDisponible()) {
			artefactos.add(artefacto)
		} else {
			throw new UserException().sinPesoDisponible()
		}
	}

	method eliminarArtefacto(artefacto) = artefactos.remove(artefacto)

	method eliminarTodosLosArtefactos() = self.artefactos().clear()

	method valorDeLucha() {
		var valorDeArtefactos = artefactos.sum({ artefacto => artefacto.unidadesDeLucha(self) })
		return self.baseLucha() + valorDeArtefactos
	}

	method especialistaEnLucha() = self.valorDeLucha() > self.nivelHechiceria()

	method estaCargado() = self.artefactos().size() >= 5

	// TP 2
	method descuentoHechizo() = self.hechizoPreferido().precio(self) * 0.5

	method pagarItem(item, descuento) {
		const precioConDescuento = item.precio(self) - descuento
		if (precioConDescuento > monedasDeOro) {
			throw new UserException().noHaySuficientesMonedas()
		}
		const resultadoMonedas = monedasDeOro - precioConDescuento
		if (resultadoMonedas < monedasDeOro) {
			self.monedasDeOro(resultadoMonedas)
		}
	}

	method cambioHechizo(nuevoHechizo) {
		self.pagarItem(nuevoHechizo, self.descuentoHechizo())
		self.hechizoPreferido(nuevoHechizo)
	}

	method comprarArtefacto(nuevoArtefacto) {
		nuevoArtefacto.diaDeCompra(new Date())
		self.pagarItem(nuevoArtefacto, 0)
		self.agregarArtefacto(nuevoArtefacto)
	}

	// TP 3
	method cargaActual() = artefactos.sum({ artefacto => artefacto.pesoTotal(self) })

	method pesoRestanteDisponible() = cargaMaxima - self.cargaActual()

}

object fuerzaOscura {

	var property valor = 5

	method eclipse() {
		valor = valor * 2
	}

}

class UserException inherits Exception {

	const sinPesoDisponible = "El personaje no tiene suficiente peso disponible para agregarEsteArtefacto"
	const noHaySuficientesMonedas = "No hay suficientes monedas"

	method sinPesoDisponible() = sinPesoDisponible

	method noHaySuficientesMonedas() = noHaySuficientesMonedas

}

