% Solución en Prolog

% Punto 1

% casa(Area)
% departamento(Ambientes, Banios)
% loft(AnioConstruccion)

% viveEn(Persona, Propiedad, Barrio)
viveEn(juan, casa(120), almagro).
viveEn(nico, departamento(3, 2), almagro).
viveEn(alf, departamento(3, 1), almagro).
viveEn(julian, loft(2000), almagro).
viveEn(vale, departamento(4, 1), flores).
viveEn(fer, casa(110), flores).

% Punto 2
viveEnPropiedadCopada(Barrio):-
    barrio(Barrio),
    forall(viveEn(_, Propiedad, Barrio), esPropiedadCopada(Propiedad)).

barrio(Barrio):-
    distinct(Barrio, viveEn(_, _, Barrio)).

esPropiedadCopada(casa(Area)):-
    Area > 100.
esPropiedadCopada(departamento(Ambientes, _)):-
    Ambientes > 3.
esPropiedadCopada(departamento(_, Banios)):-
    Banios > 1.
esPropiedadCopada(loft(Anio)):-
    Anio > 2015.

% Punto 3
esBarrioCaro(Barrio):-
    barrio(Barrio),
    not((viveEn(_, Propiedad, Barrio), esBarato(Propiedad))).

esBarato(loft(Anio)):-
    Anio < 2005.
esBarato(casa(Area)):-
    Area < 90.
esBarato(departamento(Ambientes)):-
    between(1, 2, Ambientes).