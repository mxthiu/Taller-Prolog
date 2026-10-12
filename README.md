## BD.pl

Base de conocimientos del sistema. Contiene los hechos que usan la gramática y las reglas de recomendación.

### Temas

Todos los archivos deben escribir los temas exactamente así, en minúscula y sin tildes.

- tecnologia
- matematicas
- numeros
- resolver_problemas
- electronica
- ciencias
- biologia
- naturaleza
- animales
- ayudar
- escuchar
- personas
- hablar
- escribir
- leyes
- liderar
- ensenar
- arte
- dibujar


### Profesiones

Cada profesión se guarda con el hecho `profesion(Id, Afinidades, Incompatibles)`. Las afinidades son los temas que encajan con la profesión y las incompatibles son los temas que chocan con ella.

- ingenieria_en_computadores
- ciencias_actuariales
- diseno_grafico
- arquitectura
- psicologia
- medicina
- biologia
- derecho
- educacion
- periodismo
- trabajo_social
- administracion_de_empresas
- veterinaria

Cada profesión también tiene un hecho `nombre_profesion(Id, Nombre)` con el nombre que se le muestra al usuario, por ejemplo `nombre_profesion(psicologia, 'Psicología')`.