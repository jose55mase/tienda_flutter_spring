# Tienda

Se deben instalar las herramientas para la vista  **Flutter**. y para la parte logica y menejo de informacion **Java** en este caso se usa spring boot


# Java

StackEdit stores your files in your browser, which means all your files are automatically saved locally and are accessible **offline!**

    mvn spring-boot:run

And this will produce a flow chart:

```mermaid
graph LR
A[(SQL)] -- Back-Spring --> B((Vista))
 --> F{Cliente}
B --> D{Cliente}


```

**UML Caso de compra**

```mermaid
flowchart TD
id1{{Inicia}} -->Cliente --Compra--> Producto
Producto--> id2{Si}
id2{Si} --> siCompra
id2{Si} --> noCompra
noCompra  --Guarda en DB--> dB[(Database)]
siCompra --> id4(Hace compra y genera facturas) --Guarda en DB--> dB[(Database)]
```
