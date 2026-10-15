## Ejecución

### Abrir una terminal en la carpeta del proyecto y ejecutar el comando:

swipl -s Logic.pl

### Dentro de SWI-Prolog iniciar el sistema con:

?- iniciar.

### Reiniciar preferencias guardadas

?- limpiar.

### Comandos utiles
- Ver gustos registrados: ?- listing(gusta).
- Ver rechazos registrados: ?- listing(rechaza).

## Estructura
- BD.pl:
  Base de conocimientos.

- BNF.pl:
  Gramática e interpretación de respuestas.

- Logic.pl:
  Conversación, reglas de recomendación e integración.

## Frases admitidas

Afirmativas:

- Me gusta la tecnologia
- Me gustan las matematicas
- Me interesa ayudar
- Me encanta la biologia
- Prefiero escuchar

Negativas:

- No me gusta la tecnologia
- No me gustan las matematicas
- Odio el arte
- Prefiero no hablar


## Criterio de recomendación

Una profesión es compatible cuando:

1. Comparte al menos una afinidad con los gustos del usuario.
2. Ninguno de los gustos del usuario aparece en las incompatibilidades de la profesión.
3. Ninguno de los temas rechazados por el usuario aparece entre las afinidades de la profesión.
4. El hecho `preferencias_necesarias(N)` indica cuántas preferencias válidas se piden antes de recomendar. Esta configurado en 3.

Si varias profesiones cumplen las reglas, se muestran todas.

## Limitaciones conocidas

- La gramatica utiliza un vocabulario limitado.
- No corrige errores ortográficos.
- No entiende cualquier frase del español.
- Los temas deben coincidir exactamente con los definidos en BD.pl.

## Casos de prueba

| Caso | Entrada | Resultado esperado |
|--------|----------|-------------------|
| Perfil tecnológico | Matemáticas, tecnología, resolver problemas | Ingeniería en Computadores |
| Perfil social | No tecnología, ayudar, escuchar | Psicologaa |
| Negación | Cambiar "me gusta tecnología" por "no me gusta tecnología" | Recomendación distinta |
| Respuesta inválida | "La ventana está abierta" | Solicita cambiar la respuesta |
| Sin coincidencias | Perfil incompatible | No se encontraron coincidencias |

| Caso | Entradas | Resultado esperado |
|--------|--------|--------|
|  Tecnologia | 1. Me gusta la tecnologia<br>2. Me gustan las matematicas<br>3. Me gusta resolver problemas | El sistema registra tres afinidades y recomienda profesiones compatibles con tecnología, matemáticas y resolución de problemas, como Ingeniería en Computadores y Ciencias Actuariales. |
|  Social | 1. No me gusta la tecnologia<br>2. Me interesa ayudar a las personas<br>3. Prefiero escuchar | El sistema registra una preferencia negativa y dos afinidades sociales. Debe recomendar Psicología. |



## Evidencias
<img width="411" height="341" alt="image" src="https://github.com/user-attachments/assets/d4d22b2e-0619-4c0e-82f5-b0b88e82dc5b" />

<img width="315" height="100" alt="image" src="https://github.com/user-attachments/assets/ccea3c8a-638c-4e88-8ace-60f46531946f" />



## Aportes

Luis:
- Desarrollo de BNF.pl
- Gramática DCG

Felipe:
- Desarrollo de Logic.pl
- Reglas de recomendación e integración

Nombre compañero:
- Desarrollo de BD.pl
- Base de conocimientos

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

- ingenieria_en_computadores,ciencias_actuariales,diseno_grafico,arquitectura,psicologia,medicina,biologia,derecho,educacion,periodismo,trabajo_social,administracion_de_empresas,veterinaria

Cada profesión también tiene un hecho `nombre_profesion(Id, Nombre)` con el nombre que se le muestra al usuario, por ejemplo `nombre_profesion(psicologia, 'Psicología')`.

### Preguntas

Cada pregunta se guarda con el hecho `pregunta(Tema, Texto)`. El orden de los hechos es el orden en que se hacen las preguntas.



