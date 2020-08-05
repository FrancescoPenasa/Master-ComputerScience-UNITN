# linguaggi formali e compilatori per gli amici lfc
# 12 settembre 2018

https://didatticaonline.unitn.it/dol/course/view.php?id=4839
https://didatticaonline.unitn.it/dol/enrol/index.php?id=8992

martedì 11.00 ricevimento
scritto nella pagina del moodle dove ci sono esempi di esame e robeh.
//dragon book

#analisi lessicale

#analisi sintattica

#generazione di codice intermedio



### linguaggio regolare/libero?
### algoritmo di minimizzazione


#analisi lessicale
input ->
x := while true do y*3

output ->
<id, x> <assign> <keyword, while> <id, true> <id, y> <molt> <num, 3>

#analisi sintattica

input -> output di analisi lessicale
serie di regole (produzioni)
ad ex.
selection_statement
	: IF '(' expression ')' statement
	| IF '(' expression ')' statement ELSE statement
	| SWITCH '(' expression ')' statement
	;

tutte le cose che possono essere ottenute istanziando selection_statement usando le cose scritte dopo i due punti come IF, IF ELSE, SWITCH

output -> albero di derivazione