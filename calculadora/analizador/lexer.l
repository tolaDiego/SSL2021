%{ 
  #include<stdio.h> 
  #include "y.tab.h" 
  void yyerror(char *);
%}
%option noyywrap

DIGIT   [0-9]
CONSTANTE_ENTERA    {DIGIT}+("."{DIGIT}+)?
LETRA [a-zA-Z]
IDENTIFICADOR   [A-Z]({LETRA}{0,15})

/* Rule Section */
%% 

"Inicio"                   {printf("Inicio: Palabra_reservada "); return INICIO;}
"Fin"                      {printf("Fin: Palabra_reservada"); return FIN;}
"Capturar"                 {printf("Capturar: Palabra_reservada"); return CAPTURAR;}
"Imprimir"                 {printf("Capturar: Palabra_reservada");return IMPRIMIR;}
"Declarar"                 {printf("Declarar: Palabra_reservada");return DECLARAR;}
"+"                        {printf("+: OPERADOR");return SUMA;}
"-"                        {printf("-: OPERADOR");return RESTA;}
"*"                        {printf("*: OPERADOR");return MULTIPLICACION;}
"/"                        {printf("/: OPERADOR");return DIVISION;}
"="                        {printf("=: ASIGNACION");return ASIGNACION;}
"("                        { printf("(:CARACTER_PUNTUACION");return P_APERTURA;}
")"                        { printf("(: CARACTER_PUNTUACION");return P_CIERRE;}
{CONSTANTE_ENTERA}         {printf("CONSTANTE_ENTERA");return CONSTANTE_ENTERA;}
{IDENTIFICADOR}            {printf("IDENTIFICADOR");return IDENTIFICADOR;}
"."                        {printf(".:CARACTER_PUNTUACION \n");return PUNTO;}
"\t"|"\n"|" "              {;}
.                          yyerror("Unknown character");
%%