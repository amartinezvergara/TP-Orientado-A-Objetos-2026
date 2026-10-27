import objetos.abonoFan.*
import clases.entrada.*
import clases.banda.*
import clases.asistente.*
import clases.abonoVip.*
object productora{

    var property impuestoAEntradas = 0 //inicialmente en cero ya que no especifica, lo puede modificar cuando quiera.

    const bandas = #{} //para que no se puedan repetir bandas

    const asistentes = #{} //para que no se puedan repetir asistentes

    method aniadirBanda(banda){
        bandas.add(banda)
    }

     method aniadirAsistente(asistente){
        asistentes.add(asistente)
    }

    method todasLasEntradasVendidas() = asistentes.flatMap({asistente => asistente.historialEntradas()})

    method gananciaTotal (){
        const recaudacionTotal = self.todasLasEntradasVendidas().sum({entrada => entrada.precioAlPublico()})
        const perdidaTotal = bandas.sum({banda => banda.presupuesto()})
        return recaudacionTotal - perdidaTotal
    }

    method cantidadEntradasVendidas() = self.todasLasEntradasVendidas().size()

    method laBandaMasPopular(){

        return bandas.max({bandaEvaluar =>
        self.todasLasEntradasVendidas().map({entrada => entrada.banda()}).count({banda => banda == bandaEvaluar})})
    }

    method bonificarAsistentesVip(){
        asistentes.forEach({asistente => asistente.tipoDeAbono().bonificar()})
    }
    

}
