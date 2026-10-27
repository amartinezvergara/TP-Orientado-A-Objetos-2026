

# Decisiones de Diseño

## Entrada

Conoce a una banda y a una fecha, estas son constantes con property para poder acceder a los atributos de la entrada.
precioBase es una constante = 1000
precioAlPublico es un método devuleve la suma del precio base + el impuesto a entradas definido en el objeto productora.

## Banda

La clase banda es una superclase que tiene como atributos nombre (const property) y canon base, constante = 1000000
A canonBase no le hice el property, ya que una de las subclases de Banda debe poder modificar el canon, por lo tanto, definí el método canon() = canonBase

El método presupuesto() esta definido en la superclase para retornar el canon  ya que todas las subclases utilizan el canon de alguna manera para calcular el presupuesto, el método popularidad está abstracto para ser definido en las subclases, ya que cada uno lo calcula de manera diferente, de esa manera se pueden usar polimórficamente entre las subclases.

### BandaDeRock

Subclase de Banda, tiene el atributo único de cantSolosDeGuitarra
Se overridea el método del presupuesto para que retorne super() + 10000, se overridea el método popularidad para que retorne 100*cantSolosDeGuitarra

### BandaDeTrap

Subclase de Banda, tiene el atributo único de tieneHielo
Se overridea el método del presupuesto para que retorne super() * self.popularidad(), se overridea el método popularidad para que retorne 1000 si tiene hielo y 0 si no tiene hielo.

### BandaIndie

Subclase de Banda, tiene el atributo único de cantInstrumentos
Se overridea el método del presupuesto para que retorne super() + 500 * cantInstrumentos, se overridea el método popularidad para que retorne 3.14 * nombre.length()

## Asistente

El asistente tiene un atributo historialEntradas, inicialmente es una lista vacía al que se la irán añadiendo las entradas una vez las compre, también tiene el atributo dinero disponible y el atributo tipoDeAbono

Existen 2 tipos de abono, el abono VIP que tiene un descuento y el abono fan, que no tiene un descuento.
Como el abono VIP puede tener un porcentaje de descuento distinto, lo hice como una clase para que cada instancia defina el porcentaje de descuento. Como el abono fan no tiene descuento, lo hice como un objeto con el método descuento() = 0
Ambos actuan de forma polimórfica ya que ambos tipos de abono entienden el mensaje de descuento()

El método comprarEntrada, recibe una entrada, se calcula el precio aplicándole el descuento del tipo de abono, luego si tiene dinero suficiente para pagar la entrada, se le resta el precio a su dinero disponible y se añade la entrada a historialEntradas.



