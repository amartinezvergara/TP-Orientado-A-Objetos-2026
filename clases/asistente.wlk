import clases.entrada.*
import objetos.productora.*

class Asistente{
    const property historialEntradas = []
    var dineroDisponible

    const tipoDeAbono

    method comprarEntrada(entrada){
        const precio = entrada.precioAlPublico() * (1 - tipoDeAbono.descuento())

        if (precio > dineroDisponible) console.println("Saldo insuficiente, cancelando compra")
        else{dineroDisponible -= precio
        historialEntradas.add(entrada)
    }
    }

    

    method historialEntradasAnioAnterior (){
        const hoy = new Date()
        return historialEntradas.filter({entrada => entrada.fecha().year() == hoy.year() - 1})
    }
    method nombreDeBandasVistas() = historialEntradas.map({entrada => entrada.banda()}).asSet()

}