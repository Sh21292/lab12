% Facts: directed edges between cities
edge('Makkah','Madinah').
edge('Madinah','Makkah').
edge('Madinah','Taif').
edge('Madinah','Tabuk').
edge('Tabuk','Taif').
edge('Taif','Dammam').
edge('Dammam','Qatif').
edge('Qatif','Madinah').
edge('Dammam','Riyadh').
edge('Riyadh','Dammam').
edge('Makkah','Riyadh').

% Rules: find path using an accumulator (visited list)
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

path(X, X, P, P).
path(From, To, Visited, Path) :-
    edge(From, Z),
    \+ member(Z, Visited),
    path(Z, To, [Z|Visited], Path).