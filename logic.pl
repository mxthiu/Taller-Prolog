:- encoding(utf8).
:- set_stream(user_output, encoding(utf8)).
:- consult('BD.pl').

:- dynamic gusta/1. 
:- dynamic rechaza/1.


% Registrar preferencias
registrar(afin(Tema)) :-
    assertz(gusta(Tema)),
    verificar_meta.

registrar(contra(Tema)) :-
    assertz(rechaza(Tema)),
    verificar_meta.

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

% Verificacion de si se alcanzo el limte
verificar_meta :-
    preferencias_completas,
    !,
    writeln('--- Se ha alcanzado el número de preferencias necesarias ---'),
    recomendar.
verificar_meta.

% Compatibilidades
compatible(Id) :-
    profesion(Id, Afinidades, Incompatibles),

    member(TemaAfiliado, Afinidades), % Para que sea compatible debe gustarle al usuario alguna afinidad de la profesion
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
recomendar :-
    findall(Nombre, (compatible(Id), nombre_profesion(Id, Nombre)), Lista),
    Lista \= [],
    !,
    writeln('Profesiones recomendadas:'),
    imprimir_lista(Lista).

recomendar :-
    writeln('No se encontraron coincidencias.').

imprimir_lista([]).
imprimir_lista([H|T]) :-
    format('- ~w~n', [H]),
    imprimir_lista(T).


% Reiniciar

limpiar :-
    retractall(gusta(_)),
    retractall(rechaza(_)).
