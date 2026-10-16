# OrientadorCE

Sistema experto de orientación vocacional en Prolog. Le hace preguntas al usuario, entiende sus respuestas en lenguaje natural y le recomienda una profesión.

Taller de Prolog, Paradigmas de Programación (CE1106).

## Integrantes

- Bejarano Molina Felipe Esteban
- Calvo Fernandez Mathias Fernando
- Mejias Mejias Luis Fernando

## Ejecución

Abrir una terminal en la carpeta del proyecto y cargar el archivo principal.

```
swipl -s Logic.pl
```

Dentro de SWI-Prolog, iniciar el sistema.

```
?- iniciar.
```

Para borrar las preferencias guardadas.

```
?- limpiar.
```

## Estructura

- `BD.pl` tiene la base de conocimientos (profesiones, temas y preguntas).
- `BNF.pl` tiene la gramática que interpreta las respuestas.
- `Logic.pl` tiene la conversación, las reglas de recomendación y la integración.

## Frases admitidas

Afirmativas.

- Me gusta la tecnología
- Me gustan las matemáticas
- Me interesa ayudar
- Me encanta la biología
- Prefiero escuchar

Negativas.

- No me gusta la tecnología
- No me gustan las matemáticas
- Odio el arte
- Prefiero no hablar

## Criterio de recomendación

El sistema pide 3 preferencias válidas (`preferencias_necesarias(3)` en `BD.pl`). Una profesión es compatible cuando:

1. Comparte al menos una afinidad con los gustos del usuario.
2. Ninguno de los gustos del usuario está en sus incompatibilidades.
3. Ninguno de los temas rechazados está en sus afinidades.

De las compatibles se muestran las que tienen más afinidades en común con el usuario.

## Casos de prueba

| Caso | Entrada | Resultado esperado | Estado |
|------|---------|--------------------|--------|
| Perfil tecnológico | Me gustan las matemáticas, disfruto trabajar con tecnología, me gusta resolver problemas | Ingeniería en Computadores | Pasó |
| Perfil social | No me gusta la tecnología, me interesa ayudar a las personas, prefiero escuchar a los demás | Psicología | Pasó |
| Negación | Mismo perfil tecnológico, pero cambiando "me gusta la tecnología" por "no me gusta la tecnología" | Recomendación distinta (Ciencias Actuariales) | Pasó |
| Respuesta inválida | "La ventana está abierta" | Pide otra respuesta y no la registra | Pasó |
| Sin coincidencias | Me gusta la electrónica, me gusta el arte, no me gusta la tecnología | No se encontraron coincidencias | Pasó |

## Limitaciones conocidas

- La gramática usa un vocabulario limitado y no entiende cualquier frase del español.
- No corrige errores ortográficos.
- Solo entiende un tema por frase.

## Evidencias
<img width="411" height="341" alt="image" src="https://github.com/user-attachments/assets/d4d22b2e-0619-4c0e-82f5-b0b88e82dc5b" />

<img width="315" height="100" alt="image" src="https://github.com/user-attachments/assets/ccea3c8a-638c-4e88-8ace-60f46531946f" />

## Aportes

Bejarano Molina Felipe Esteban
- Desarrollo de `Logic.pl`
- Reglas de recomendación e integración

Calvo Fernandez Mathias Fernando
- Desarrollo de `BD.pl`
- Base de conocimientos

Mejias Mejias Luis Fernando
- Desarrollo de `BNF.pl`
- Gramática DCG
