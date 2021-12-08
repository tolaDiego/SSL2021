%{ 
   #include<stdio.h> 
   int yylex(void);
   void yyerror(char *s);
   FILE *yyin;
%} 
  
%token INICIO FIN DECLARAR IMPRIMIR CAPTURAR CONSTANTE_ENTERA  SUMA RESTA MULTIPLICACION DIVISION ASIGNACION IDENTIFICADOR PUNTO P_APERTURA P_CIERRE
  
%left '+' '-'
%left '*' '/'
  
/* Rule Section */
%% 

Init:
   INICIO PUNTO Resto_programa;
Resto_programa:
                FIN PUNTO|Sentencia_asignacion PUNTO Resto_programa | Declaracion PUNTO Resto_programa | Sentencia_entrada PUNTO Resto_programa | Sentencia_salida PUNTO Resto_programa;
Sentencia_asignacion:
                 IDENTIFICADOR ASIGNACION Expresion;
Declaracion:
                 DECLARAR IDENTIFICADOR;                   
Sentencia_entrada:
                 P_APERTURA IDENTIFICADOR  P_CIERRE;
Sentencia_salida:
                 P_APERTURA IDENTIFICADOR  P_CIERRE;
Expresion:
                Termino | Termino Operador Termino;
Termino:
                CONSTANTE_ENTERA | P_APERTURA Expresion P_CIERRE;
Operador:
                SUMA | RESTA | MULTIPLICACION | DIVISION
  
%% 
  
//driver code 
void parse(FILE *file) { 
   yyin = file;
   yyparse();
   fclose(yyin);
} 
  
void yyerror(char *s) { 
   printf(" \n%s\n", s); 
}