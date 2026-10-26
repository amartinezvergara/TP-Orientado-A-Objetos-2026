class Banda{
    const property nombre
    const canonBase = 1000000
    method presupuesto() = self.canon()
    method popularidad()

    method canon() = canonBase // para las bandas de trap
}

class BandaDeRock inherits Banda{

    const cantSolosDeGuitarra

    override method presupuesto() = super() + 10000
    override method popularidad() = 100*cantSolosDeGuitarra
}

class BandaDeTrap inherits Banda{
    const tieneHielo

    override method popularidad(){
    if (tieneHielo) return 1000
    else return 0
    }

    override method canon() = super()*self.popularidad()

}

class BandaIndie inherits Banda{
    const cantidadDeInstrumentos
    override method popularidad() = 3.14 * nombre.length() 
    override method presupuesto() = super() + 500 * cantidadDeInstrumentos
}
