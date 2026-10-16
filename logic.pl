:- encoding(utf8).
:- set_stream(user_output, encoding(utf8)).

:- consult('BD.pl').
:- consult('BNF.pl').

:- dynamic gusta/1.
:- dynamic rechaza/1.

% Registro de preferencias

registrar(afin(Tema)) :-
    gusta(Tema),
    !,
    writeln('Eso ya me lo habías dicho.').
registrar(contra(Tema)) :-
    rechaza(Tema),
    !,
    writeln('Eso ya me lo habías dicho.').
registrar(afin(Tema)) :-
    rechaza(Tema),
    !,
    writeln('Antes me dijiste lo contrario sobre ese tema.').
registrar(contra(Tema)) :-
    gusta(Tema),
    !,
    writeln('Antes me dijiste lo contrario sobre ese tema.').

registrar(afin(Tema)) :-
    \+ rechaza(Tema),
    \+ gusta(Tema),
    assertz(gusta(Tema)).

registrar(contra(Tema)) :-
    \+ gusta(Tema),
    \+ rechaza(Tema),
    assertz(rechaza(Tema)).

cantidad_preferencias(Total) :-
    findall(G, gusta(G), Gustan),
    findall(R, rechaza(R), Rechazan),
    length(Gustan, L1),
    length(Rechazan, L2),
    Total is L1 + L2.

preferencias_completas :-
    preferencias_necesarias(N),
    cantidad_preferencias(Total),
    Total >= N.

% Compatibilidad de profesiones
compatible(Id) :-
    profesion(Id, Afinidades, Incompatibles),

    % Debe coincidir al menos un gusto del usuario
    member(TemaAfiliado, Afinidades),
    gusta(TemaAfiliado),

    forall(
        gusta(G),
        \+ member(G, Incompatibles)
    ),

    forall(
        rechaza(R),
        \+ member(R, Afinidades)
    ).

% Recomendaciones
puntaje(Id, Puntos) :-
    profesion(Id, Afinidades, _),
    findall(T, (member(T, Afinidades), gusta(T)), Coinciden),
    length(Coinciden, Puntos).

recomendar :-
    findall(Puntos-Nombre,
            ( compatible(Id), puntaje(Id, Puntos), nombre_profesion(Id, Nombre) ),
            Pares),
    Pares \== [],
    !,
    pairs_keys(Pares, Claves),
    max_list(Claves, Maximo),
    setof(N, member(Maximo-N, Pares), Mejores),
    writeln('Profesiones recomendadas:'),
    imprimir_lista(Mejores).

recomendar :-
    writeln('No se encontraron coincidencias.').

imprimir_lista([]).

imprimir_lista([H|T]) :-
    format('- ~w~n', [H]),
    imprimir_lista(T).

% Controlador de preguntas
preguntar(TextoPregunta) :-
    writeln(TextoPregunta),
    read_line_to_string(user_input, Respuesta),

    texto_a_palabras(Respuesta, Palabras),

    (
        interpretar(Palabras, Preferencia)
    ->
        registrar(Preferencia)
    ;
        writeln('Respuesta invalida, Intenta otra vez :)'),
        preguntar(TextoPregunta)
    ).


% Conversacion principal

iniciar :-
    limpiar,
    writeln('Bienvenido a OrientadorCE.'),
    writeln('Responda utilizando frases como:'),
    writeln('"Me gusta la tecnologia"'),
    writeln('"No me gusta el arte"'),
    nl,

    findall(
        pregunta(Tema, Texto),
        pregunta(Tema, Texto),
        Preguntas
    ),

    conversacion(Preguntas).

    % Condicion de parada ( se tiene suficientes preguntas)
conversacion(_) :-
    preferencias_completas,
    !,
    nl,
    writeln('--- Se alcanzo el numero de preferencias necesarias ---'),
    recomendar.

conversacion([]) :-
    !,
    nl,
    writeln('--- No hay mas preguntas disponibles ---'),
    recomendar.

% Preguntar siguiente tema
conversacion([pregunta(Tema, _)|Resto]) :-

    (
        gusta(Tema)
        ;
        rechaza(Tema)
    ),
    !,
    conversacion(Resto).

conversacion([pregunta(_, Texto)|Resto]) :-
    preguntar(Texto),
    conversacion(Resto).

limpiar :-
    retractall(gusta(_)),
    retractall(rechaza(_)).