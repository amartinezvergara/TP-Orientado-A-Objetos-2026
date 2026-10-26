import objetos.abonoFan.*
import clases.entrada.*
import clases.banda.*
import clases.asistente.*
import clases.abonoVip.*
object productora{

    const bandas = []

    const asistentes = []

    method aniadirBanda(banda){
        bandas.add(banda)
    }

     method aniadirAsistente(asistente){
        asistentes.add(asistente)
    }
    
    method impuestoAEntradas() = 0 //

    method todasLasEntradasVendidas(){
        return asistentes.flatMap({asistente => asistente.historialEntradas()})
    }

    method gananciaTotal (){
        const recaudacionTotal = self.todasLasEntradasVendidas().sum({entrada => entrada.precioAlPublico()})
        const perdidaTotal = bandas.sum({banda =>
        banda.presupuesto()})
        return recaudacionTotal - perdidaTotal
    }

    method cantidadEntradasVendidas() = self.todasLasEntradasVendidas().size()

    method laBandaMasPopular(){

        return bandas.max({bandaEvaluar =>
        self.cantidadEntradasVendidas().map({entrada => entrada.banda()}).count({banda => banda == bandaEvaluar})})
    }

    method bonificarAsistentesVip(){
        asistentes.forEach({asistente => if (asistente.tipoDeAbono() != abonoFan){
        asistente.tipoDeAbono().bonificar()}})
    }
    

}
