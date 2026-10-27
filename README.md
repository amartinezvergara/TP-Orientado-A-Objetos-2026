

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

El asistente es una clase, tiene un atributo historialEntradas, inicialmente es una lista vacía al que se la irán añadiendo las entradas una vez las compre, también tiene el atributo dinero disponible y el atributo tipoDeAbono

* Existen 2 tipos de abono, el abono VIP que tiene un descuento y el abono fan, que no tiene un descuento.

* Como el abono VIP puede tener un porcentaje de descuento distinto, lo hice como una clase para que cada instancia defina el porcentaje de descuento en el atributo descuento que es una variable. Hice el getter de descuento aparte ya que necesito usarlo desde otros objetos y necesito que sea una variable para modificarlo, pero esta modificación solo la hago desde el método bonificar() en la clase AbonoVip, que le suma 0.01, no quiero poder modificar directamente. Como el abono fan no tiene descuento, lo hice como un objeto con el método descuento() = 0

* Más tarde se implementó la funcionalidad de bonificar asistentes vip, que mencioné antes en la justificación para como declarar el atributo descuento en la clase AbonoVip, este método añade 1% de descuento extra a los asistentes vip, en el objeto abonoFan es un método vacío.

* Ambos actúan de forma polimórfica como interfaz, ya que ambos tipos de abono entienden el mensaje de descuento() y bonificacion()

El método comprarEntrada, recibe una entrada, se calcula el precio aplicándole el descuento del tipo de abono, luego si tiene dinero suficiente para pagar la entrada, se le resta el precio a su dinero disponible y se añade la entrada a historialEntradas.

Se aplicó manejo de errores haciendo que se tire una excepción de ExcepcionDineroInsuficiente justamente si no tiene dinero para comprar la entrada

* ExcepcionDineroInsuficiente es una subclase de Exception siempre creada ya con el atributo mensaje reemplazado por "Dinero Insuficiente para comprar la entrada"

El método historialEntradasAnioAnterior, filtra la lista historialEntradas para solo devolver las entradas cuyo año sea igual al año anterior a la fecha de correr el programa. Aqui se utiliza un objeto temporal que solo vive dentro del método, const hoy = new Date()

El método nombreDeBandasVistas, realiza un map a la lista historialEntradas para obtener una lista solo con el nombre de las bandas, la cual se convierte en un set para eliminar los repetidos.

## Productora

Como la productora es solo una, es un objeto, esta tiene los atributos impuestoAEntradas que arranca inicializada en 0 (porque no se especifica un monto inicial), es un varProperty para poder acceder a ella desde la entrada para calcular el precio final, y para poder modificarla, cosa que es requerida por el sistema.

También tiene los atributos bandas y asistentes, ambos inicializados como sets vacíos para que no puedan repetirse elementos, no tiene sentido guardar dos veces la misma banda o el mismo asistente como sí entradas, por ejemplo.

Creé los métodos aniadirBanda(banda) y aniadirAsistente(asistente) simplemente para tener una forma de añadir elementos a los sets.

El método todasLasEntradasVendidas es un método auxiliar que se utiliza en los varios métodos requeridos por el sistema, se encarga de hacer un flatMap de cada historialEntradas de cada asistente en el set asistentes, su único propósito es no repetir lógica.

El método gananciaTotal realiza una sumatoria del precioFinal de cada entrada vendida, se le resta la sumatoria del presupuesto de cada banda y retorna la diferencia.

El método laBandaMasPopular retorna la banda que más entradas vendió, para eso realizo un max de la lista de bandas, cuya condicion sea un count de las veces que aparece la banda en la lista de todas las entradas vendidas.

Por último, el método bonificarAsistentesVip, es un método de efecto que hace un forEach con la lista de asistentes, haciendo que al tipoDeAbono de cada asistente se le aplica el método de bonificar, como mencioné antes, ambos tipos de abono entienden el mensaje, solo que uno de ellos hace realmente algo, dando como resultado que solo los abonos vip se vean modificados.







