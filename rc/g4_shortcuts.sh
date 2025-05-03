#!/bin/bash

alias g4="antlr4" 		# usar em ficheiros .g4 para gerar o java
alias g4run="antlr4-run"	# usa o código java para testar a linguagem usando input do utilizador
alias g4test="antlr4-test"	# testa a syntaxe apenas da gramática
alias g4cmp="antlr4-javac *.java" # compila todos os .javac
alias g4main="antlr4-main"
alias g4visitor="antlr4-visitor"

g4up(){
	# prepara a linguagem a partir do .g4
	# quando usar?
	#	alguma alteração na gramática
	antlr4 "$1"
	antlr4-javac *.java
}

g4VisitorMain(){
	# criar as funcções de visita e a main
	g4visitor "$1" "$2" "$3"
	g4main -v "$2"
}

g4help(){
	echo "
g4 xpto.g4 -> cria os ficheiros .java
g4visitor <Nome da linguagem sem o .g4> <Nome do ficheiro .java> <Tipo de retorno das funções>
g4main <argumentos do antlr4-main> -> cria um ficheiro main
g4cmp -> compila todos os ficheiros .java
g4test -> executa antlr4-test para testar a gramática
g4run -> executa a main
"
}
