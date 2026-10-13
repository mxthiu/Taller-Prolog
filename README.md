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

### Preguntas

Cada pregunta se guarda con el hecho `pregunta(Tema, Texto)`. El orden de los hechos es el orden en que se hacen las preguntas.

### Preferencias necesarias

El hecho `preferencias_necesarias(N)` indica cuántas preferencias válidas se piden antes de recomendar. Por ahora es 3.

### Consultas de prueba

Para revisar la base de datos, cargar `swipl BD.pl` y probar estas consultas.

- `profesion(psicologia, Afinidades, Incompatibles).`
- `nombre_profesion(diseno_grafico, Nombre).`
- `pregunta(tecnologia, Texto).`
- `profesion(Id, Afinidades, _), member(tecnologia, Afinidades).`