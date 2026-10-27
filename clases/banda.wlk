class Banda{
    const property nombre
    const canonBase = 1000000

    method canon() = canonBase // para que las bandas de trap puedan overridear el canon

    method presupuesto() = self.canon()
    method popularidad()

    
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

    override method canon() = super() * self.popularidad()

}

class BandaIndie inherits Banda{
    const cantInstrumentos
    override method popularidad() = 3.14 * nombre.length()
    override method presupuesto() = super() + 500 * cantInstrumentos
}
