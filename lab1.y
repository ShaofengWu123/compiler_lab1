%{
   /* definition */
   #include <stdio.h>
   #include <stdlib.h>
   #include <ctype.h>  
   int yylex();
   void yyerror(char *s);

%}
%token number

%%
T : E '<' number {if($1 >= $3){printf("False\n");exit(1);}else{printf("True\n\n");}}
  | E '>' number {if($1 <= $3){printf("False\n");exit(1);}else{printf("True\n\n");}}
  ;
E : E '<' number  {if($1 >= $3){printf("False\n");exit(1);}else{$$ = $3;}}
  | E '>' number  {if($1 <= $3){printf("False\n");exit(1);}else{$$ = $3;}}
  | number {$$ = $1;}
  ; 
%%

int yylex()
{
   int c;
   while ( ( c=getchar() ) == ' ' ) ;
   if (isdigit(c)){
    ungetc( c, stdin );
   	scanf("%d", &yylval); // value for token
   	return number;
   }
   if ( c=='\n' ) return 0; // return EOF -- $
   return c;
}

int main()
{
   return yyparse();
}

void yyerror(char *s)
{
   printf("%s\n", s ); 
}

int yywrap()
{ return 1; }  
