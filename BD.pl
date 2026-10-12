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