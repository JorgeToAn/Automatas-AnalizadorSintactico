package com.proyecto;

import java_cup.runtime.*;

%%
%public
%class Lexer
%cup
%line
%column

// PALABRAS RESERVADAS
resPrincipal    =   "codigo-principal"
resFuncs        =   "funciones"
resFunc         =   "funcion"
resProcs        =   "procedimientos"
resProc         =   "procedimiento"
resVars         =   "variables"
resVar          =   "variable"
resInicio       =   "inicio"
resFin          =   "fin"
resEntero       =   "entero"
resDecimal      =   "decimal"
resSimbolo      =   "simbolo"
resTexto        =   "texto"
resLogico       =   "logico"
resFechaHora    =   "fecha-hora"
resFecha        =   "fecha"
resHora         =   "hora"
resCurp         =   "curp"
resRfc          =   "rfc"
resDevolver     =   "devolver"
resComo         =   "como"
resSi           =   "si"
resEntonces     =   "entonces"
resSino         =   "sino"
resPara         =   "para"
resMientras     =   "mientras"
resRomper       =   "romper"

// DATOS
entero          =   -?(0|[1-9][0-9]*)
decimal         =   -?(0|[1-9][0-9]*)\.[0-9]*
simbolo         =   '.'
texto           =   \"[^\"]*\"
falso           =   "falso"
verdadero       =   "verdadero"
fechaHora       =   (0{3}[1-9]|0{2}[1-9][0-9]|0[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[1|3|5|7|8]|1[0|2])-(0[1-9]|[1-2][0-9]|30|31))|((0[4|6|9]|11)-(0[1-9]|[1-2][0-9]|30))|(02)-(0[1-9]|[1-2][0-9]))T([0-2][0-4]|[0-1][0-9]):[0-5][0-9]:[0-5][0-9]
fecha           =   (0{3}[1-9]|0{2}[1-9][0-9]|0[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[1|3|5|7|8]|1[0|2])-(0[1-9]|[1-2][0-9]|30|31))|((0[4|6|9]|11)-(0[1-9]|[1-2][0-9]|30))|(02)-(0[1-9]|[1-2][0-9]))
hora            =   ([0-2][0-4]|[0-1][0-9]):[0-5][0-9]:[0-5][0-9]
curp            =   [A-Z][AEIOU][A-Z]{2}[0-9]{2}(((0[13578]|1[02])(0[1-9]|[1-2][0-9]|30|31))|((0[469]|11)(0[1-9]|[1-2][0-9]|30))|(02)(0[1-9]|[1-2][0-9]))(H|M)(AS|BC|BS|CC|CL|CM|CS|CH|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)([B-DF-HJ-NP-TV-Z]{3})[A-Z0-9][0-9]
rfc             =   ([A-Z]{4}[0-9]{2}(((0[13578]|1[02])(0[1-9]|[1-2][0-9]|30|31))|((0[469]|11)(0[1-9]|[1-2][0-9]|30))|(02)(0[1-9]|[1-2][0-9])))|([A-Z]{3}[0-9]{2}(((0[13578]|1[02])(0[1-9]|[1-2][0-9]|30|31))|((0[469]|11)(0[1-9]|[1-2][0-9]|30))|(02)(0[1-9]|[1-2][0-9])))[A-Z0-9]{3}

// IDENTIFICADOR
id              =   [a-zA-ZáÁéÉíÍóÓúÚüÜ][a-zA-ZáÁéÉíÍóÓúÚüÜ0-9_]*

// OPERADORES MATEMATICOS
suma          =   "+"
resta         =   "-"
mul           =   "*"
div           =   "/"
mod           =   "%"
inc           =   "++"
dec           =   "--"

// OPERADORES DE ASIGNACION
asignacion      =   "="
asgSuma         =   "+="
asgRes          =   "-="
asgMul          =   "*="
asgDiv          =   "/="
asgMod          =   "%="

// OPERADORES DE COMPARACION
igual           =   "=="
desigual        =   "!="
mayor           =   ">"
menor           =   "<"
mayorIgual      =   ">="
menorIgual      =   "<="

// OPERADORES LOGICOS
and             =   "_Y_"
or              =   "_O_"
not             =   "~"

// SEPARADORES
// punto           =   "."
// 2puntos         =   ":"
// coma            =   ","
// izqParen        =   "("
// derParen        =   ")"

// ESPACIO BLANCO Y COMENTARIOS
comentario      =   #.*\n
whitespace      =   \t|\f|" "|\r|\n

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%

{resPrincipal}          { return symbol(ParserSym.R_PRINCIPAL, yytext()); }
{resFuncs}              { return symbol(ParserSym.R_FUNCS, yytext()); }
{resFunc}               { return symbol(ParserSym.R_FUNC, yytext()); }
{resProcs}              { return symbol(ParserSym.R_PROCS, yytext()); }
{resProc}               { return symbol(ParserSym.R_PROC, yytext()); }
{resVars}               { return symbol(ParserSym.R_VARS, yytext()); }
{resVar}                { return symbol(ParserSym.R_VAR, yytext()); }
{resInicio}             { return symbol(ParserSym.R_INICIO, yytext()); }
{resFin}                { return symbol(ParserSym.R_FIN, yytext()); }
{resEntero}             { return symbol(ParserSym.R_ENTERO, yytext()); }
{resDecimal}            { return symbol(ParserSym.R_DECIMAL, yytext()); }
{resSimbolo}            { return symbol(ParserSym.R_SIMBOLO, yytext()); }
{resTexto}              { return symbol(ParserSym.R_TEXTO, yytext()); }
{resLogico}             { return symbol(ParserSym.R_LOGICO, yytext()); }
{resFechaHora}          { return symbol(ParserSym.R_FECHAHORA, yytext()); }
{resFecha}              { return symbol(ParserSym.R_FECHA, yytext()); }
{resHora}               { return symbol(ParserSym.R_HORA, yytext()); }
{resCurp}               { return symbol(ParserSym.R_CURP, yytext()); }
{resRfc}                { return symbol(ParserSym.R_RFC, yytext()); }
{resDevolver}           { return symbol(ParserSym.R_DEVOLVER, yytext()); }
{resComo}               { return symbol(ParserSym.R_COMO, yytext()); }
{resSi}                 { return symbol(ParserSym.R_SI, yytext()); }
{resEntonces}           { return symbol(ParserSym.R_ENTONCES, yytext()); }
{resSino}               { return symbol(ParserSym.R_SINO, yytext()); }
{resPara}               { return symbol(ParserSym.R_PARA, yytext()); }
{resMientras}           { return symbol(ParserSym.R_MIENTRAS, yytext()); }
{resRomper}             { return symbol(ParserSym.R_ROMPER, yytext()); }

{entero}                { return symbol(ParserSym.ENTERO, Integer.valueOf(yytext())); }
{decimal}               { return symbol(ParserSym.DECIMAL, Float.valueOf(yytext())); }
{simbolo}               { return symbol(ParserSym.SIMBOLO, yytext()); }
{texto}                 { return symbol(ParserSym.TEXTO, yytext()); }
{falso}                 { return symbol(ParserSym.FALSO, yytext()); }
{verdadero}             { return symbol(ParserSym.VERDADERO, yytext()); }
{fechaHora}             { return symbol(ParserSym.FECHAHORA, yytext()); }
{fecha}                 { return symbol(ParserSym.FECHA, yytext()); }
{hora}                  { return symbol(ParserSym.HORA, yytext()); }
{curp}                  { return symbol(ParserSym.CURP, yytext()); }
{rfc}                   { return symbol(ParserSym.RFC, yytext()); }

{id}                    { return symbol(ParserSym.ID, yytext()); }

{suma}                  { return symbol(ParserSym.SUMA, yytext()); }
{resta}                 { return symbol(ParserSym.RESTA, yytext()); }
{mul}                   { return symbol(ParserSym.MUL, yytext()); }
{div}                   { return symbol(ParserSym.DIV, yytext()); }
{mod}                   { return symbol(ParserSym.MOD, yytext()); }
{inc}                   { return symbol(ParserSym.INC, yytext()); }
{dec}                   { return symbol(ParserSym.DEC, yytext()); }

{asignacion}            { return symbol(ParserSym.ASG, yytext()); }
{asgSuma}               { return symbol(ParserSym.ASG_SUMA, yytext()); }
{asgRes}                { return symbol(ParserSym.ASG_RESTA, yytext()); }
{asgMul}                { return symbol(ParserSym.ASG_NUL, yytext()); }
{asgDiv}                { return symbol(ParserSym.ASG_DIV, yytext()); }
{asgMod}                { return symbol(ParserSym.ASG_MOD, yytext()); }

{igual}                 { return symbol(ParserSym.IGUAL, yytext()); }
{desigual}              { return symbol(ParserSym.DESIGUAL, yytext()); }
{mayor}                 { return symbol(ParserSym.MAYOR, yytext()); }
{menor}                 { return symbol(ParserSym.MENOR, yytext()); }
{mayorIgual}            { return symbol(ParserSym.MAY_IG, yytext()); }
{menorIgual}            { return symbol(ParserSym.MEN_IG, yytext()); }

{and}                   { return symbol(ParserSym.AND, yytext()); }
{or}                    { return symbol(ParserSym.OR, yytext()); }
{not}                   { return symbol(ParserSym.NOT, yytext()); }

"."                     { return symbol(ParserSym.PUNTO, yytext()); }
":"                     { return symbol(ParserSym.DOSPUNTOS, yytext()); }
","                     { return symbol(ParserSym.COMA, yytext()); }
"("                     { return symbol(ParserSym.I_PAREN, yytext()); }
")"                     { return symbol(ParserSym.D_PAREN, yytext()); }

{comentario}            { /* IGNORAR */ }
{whitespace}            { /* IGNORAR */ }

[^] { throw new Error("Caracter ilegal <" + yytext() + ">\n Linea: " + yyline() + "Columna: " + yycolumn() ); }