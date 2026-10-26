import objetos.productora.*

class Entrada{
    const property banda
    const property fecha // clase Date
    const precioBase = 1000
    
    method precioAlPublico() = precioBase + productora.impuestoAEntradas()
}