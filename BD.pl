:- encoding(utf8).
% BD.pl
% Base de conocimientos de OrientadorCE.

% Temas usados por los tres archivos.
% tecnologia, matematicas, numeros, resolver_problemas, electronica,
% ciencias, biologia, naturaleza, animales, ayudar, escuchar, personas,
% hablar, escribir, leyes, liderar, ensenar, arte, dibujar

% Cantidad de preferencias validas que se piden antes de recomendar.
preferencias_necesarias(3).

% profesion(Id, Afinidades, Incompatibles)
profesion(ingenieria_en_computadores, [matematicas, tecnologia, resolver_problemas, electronica], [arte, naturaleza]).
profesion(ciencias_actuariales, [matematicas, numeros, resolver_problemas], [arte, naturaleza]).
profesion(diseno_grafico, [arte, dibujar, tecnologia], [numeros, matematicas]).
profesion(arquitectura, [arte, dibujar, matematicas, tecnologia], [animales]).
profesion(psicologia, [ayudar, escuchar, personas, ciencias], [tecnologia, electronica]).
profesion(medicina, [ayudar, ciencias, biologia, resolver_problemas], [escribir]).
profesion(biologia, [biologia, naturaleza, ciencias, animales], [tecnologia, electronica]).
profesion(derecho, [hablar, leyes, escribir, personas], [electronica, numeros]).
profesion(educacion, [ensenar, personas, hablar, ayudar], [electronica]).
profesion(periodismo, [escribir, hablar, personas], [matematicas, electronica]).
profesion(trabajo_social, [ayudar, personas, liderar, hablar], [electronica, numeros]).
profesion(administracion_de_empresas, [liderar, hablar, numeros, personas], [dibujar, biologia]).
profesion(veterinaria, [animales, biologia, ayudar, naturaleza], [tecnologia, leyes]).

% nombre_profesion(Id, Nombre)
nombre_profesion(ingenieria_en_computadores, 'Ingeniería en Computadores').
nombre_profesion(ciencias_actuariales, 'Ciencias Actuariales').
nombre_profesion(diseno_grafico, 'Diseño Gráfico').
nombre_profesion(arquitectura, 'Arquitectura').
nombre_profesion(psicologia, 'Psicología').
nombre_profesion(medicina, 'Medicina').
nombre_profesion(biologia, 'Biología').
nombre_profesion(derecho, 'Derecho').
nombre_profesion(educacion, 'Educación').
nombre_profesion(periodismo, 'Periodismo').
nombre_profesion(trabajo_social, 'Trabajo Social').
nombre_profesion(administracion_de_empresas, 'Administración de Empresas').
nombre_profesion(veterinaria, 'Veterinaria').

% pregunta(Tema, Texto)
pregunta(tecnologia, '¿Te gusta la tecnología?').
pregunta(resolver_problemas, '¿Te gusta resolver problemas?').
pregunta(ayudar, '¿Te interesa ayudar a las personas?').
pregunta(escuchar, '¿Prefieres escuchar a los demás?').
pregunta(matematicas, '¿Te gustan las matemáticas?').
pregunta(arte, '¿Te gusta el arte?').
pregunta(ciencias, '¿Te interesan las ciencias?').
pregunta(animales, '¿Te gustan los animales?').
pregunta(hablar, '¿Te gusta hablar en público?').
pregunta(escribir, '¿Te gusta escribir?').
pregunta(liderar, '¿Te gusta liderar grupos?').
pregunta(ensenar, '¿Te gusta enseñar?').