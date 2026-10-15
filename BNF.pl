
:- encoding(utf8).

% Convierte el texto del usuario en una lista de palabras.
texto_a_palabras(Texto, Palabras) :-
    atom(Texto),
    atom_string(Texto, Cadena),
    texto_a_palabras(Cadena, Palabras).

texto_a_palabras(Texto, Palabras) :-
    string(Texto),
    string_lower(Texto, Minusculas),
    string_chars(Minusculas, Caracteres),
    maplist(limpiar_caracter, Caracteres, Limpios),
    string_chars(TextoLimpio, Limpios),
    split_string(TextoLimpio, " ", " ", Partes),
    maplist(atom_string, Palabras, Partes).

% Quita las tildes y los signos para usar los temas de BD.pl.
limpiar_caracter('á', 'a') :- !.
limpiar_caracter('é', 'e') :- !.
limpiar_caracter('í', 'i') :- !.
limpiar_caracter('ó', 'o') :- !.
limpiar_caracter('ú', 'u') :- !.
limpiar_caracter('ü', 'u') :- !.
limpiar_caracter('ñ', 'n') :- !.
limpiar_caracter(Caracter, Caracter) :-
    char_type(Caracter, alnum), !.
limpiar_caracter(_, ' ').

% Devuelve una afinidad o un rechazo si entiende toda la frase.
interpretar(Palabras, Preferencia) :-
    phrase(oracion(Preferencia), Palabras).

% Las frases con no, odio o prefiero no son negativas.
oracion(contra(Tema)) --> [no], afirmacion(Tema).
oracion(contra(Tema)) --> [prefiero, no], objeto(Tema).
oracion(contra(Tema)) --> [odio], objeto(Tema).
oracion(afin(Tema)) --> afirmacion(Tema).

% Formas de expresar que algo le gusta al usuario.
afirmacion(Tema) --> [me, gusta], objeto(Tema).
afirmacion(Tema) --> [me, gustan], objeto(Tema).
afirmacion(Tema) --> [me, interesa], objeto(Tema).
afirmacion(Tema) --> [me, interesan], objeto(Tema).
afirmacion(Tema) --> [me, encanta], objeto(Tema).
afirmacion(Tema) --> [me, encantan], objeto(Tema).
afirmacion(Tema) --> [disfruto, trabajar, con], objeto(Tema).
afirmacion(Tema) --> [me, gusta, trabajar, con], objeto(Tema).
afirmacion(Tema) --> [prefiero], objeto(Tema).

% Algunos temas se pueden escribir con articulo o sin articulo.
objeto(Tema) --> articulo, tema(Tema).

articulo --> [el].
articulo --> [la].
articulo --> [los].
articulo --> [las].
articulo --> [].

% Todos los temas usan los mismos nombres que el README.
tema(tecnologia) --> [tecnologia].
tema(matematicas) --> [matematicas].
tema(numeros) --> [numeros].
tema(resolver_problemas) --> [resolver, problemas].
tema(resolver_problemas) --> [resolucion, de, problemas].
tema(electronica) --> [electronica].
tema(ciencias) --> [ciencias].
tema(biologia) --> [biologia].
tema(naturaleza) --> [naturaleza].
tema(animales) --> [animales].
tema(ayudar) --> [ayudar, a, las, personas].
tema(ayudar) --> [ayudar].
tema(escuchar) --> [escuchar, a, los, demas].
tema(escuchar) --> [escuchar, a, las, personas].
tema(escuchar) --> [escuchar].
tema(personas) --> [personas].
tema(hablar) --> [hablar, en, publico].
tema(hablar) --> [hablar].
tema(escribir) --> [escribir].
tema(leyes) --> [leyes].
tema(liderar) --> [liderar, grupos].
tema(liderar) --> [liderar].
tema(ensenar) --> [ensenar].
tema(arte) --> [arte].
tema(dibujar) --> [dibujar].
