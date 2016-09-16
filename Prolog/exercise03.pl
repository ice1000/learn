number_list([Head|[]]) :- number(Head).
number_list([Head|Tail]) :- number(Head), number_list(Tail).



