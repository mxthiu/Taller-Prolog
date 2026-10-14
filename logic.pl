:- consult('BD.pl').

:- dynamic gusta/1.
:- dynamic rechaza/1.


% Registrar preferencias
registrar(afin(Tema)) :-
    assertz(gusta(Tema)).

registrar(contra(Tema)) :-
    assertz(rechaza(Tema)).


% Compatibilidades
compatible(Id) :-
    profesion(Id, Afinidades, Incompatibles),

    forall(
        gusta(Tema),
        \+ member(Tema, Incompatibles)
    ),

    forall(
        rechaza(Tema),
        \+ member(Tema, Afinidades)
    ).

% Recomendaciones

recomendar :-
    compatible(Id),
    nombre_profesion(Id, Nombre),
    write('Profesion recomendada: '),
    writeln(Nombre).

recomendar :-
    writeln('No se encontraron coincidencias.').


% Reiniciar

limpiar :-
    retractall(gusta(_)),
    retractall(rechaza(_)).
