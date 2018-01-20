digit           [0-9]
integer         {digit}+
float           {digit}*(\.{digit}+)
identifier      [a-zA-Z][a-zA-Z0-9]*
boolean         (true|false)
summation       (((integer|float)"+")+(integer|float))
substraction    (((integer|float)"-")+(integer|float))
multiplication  (((integer|float)"*")+(integer|float))
division        (((integer|float)"/")+(integer|float))
concatenation   ((identifier)+identifier)
leftCurl        ('{')
rightCurl       ('}')
leftPar         ('(')
rightPar        (')')
comment         \/\/[^\n]*



returntype      ("Rinteger"|"Rstring"|"Rfloat”|”Rboolean"|"Rshape"|"Rlocation"|"Rsize"|"Rcolor"|"void")



%%

\[              printf("A left bracket\n");
\]              printf("A right bracket\n");
\(              printf("A left parenthesis\n");
\)              printf("A right paranthesis\n");
\,              printf("A comma\n");
\{              printf("A left curlybracket\n");
\}              printf("A right curlybracket\n");
\=              printf("Assignment operator\n");
\+              printf("Summation operator\n");
\-              printf("Substraction operator\n");
\*              printf("Multiplication operator\n");
\/              printf("Division operator\n");
\=\=            printf("Equals to indicator\n");
!\=             printf("Not equals to indicator\n");
\<\=            printf("Less than or equal to indicator\n");
\<              printf("Less than indicator\n");
\>\=            printf("Greater than or equal to indicator\n");
\>              printf("Greater than indicator\n");
begin           printf("Begining of the main\n");
end             printf("End of the main\n");



draw.			printf("Draw Function\n");
drawDefault.	printf("DrawDefault Function\n");

\.location      printf("Type Location\n");
\.size          printf("Type Size\n");
\.color         printf("Type Color\n");
\.strokeWidth   printf("Type StrokeWidth\n");
\.width         printf("Type Width as : 1%d\n ",atoi(yytext));
\.xValue        printf("Type x value of the location as: %d\n",atoi(yytext));
\.yValue        printf("Type y value of the location as: %d\n",atoi(yytext));
\.height        printf("Type Height as : %d\n",atoi(yytext));
\.direction     printf("A direction as: %s\n",yytext);
\.rounded       printf("Rounded as: %s\n",yytext);
\.arrow         printf("Arrow as: %s\n",yytext);
\.arrowSize     printf("Arrow Size as:%d \n",atoi(yytext));


Width           printf("Type Width as : 1%d\n ",atoi(yytext));
xValue          printf("Type x value of the location as: %d\n",atoi(yytext));
yValue          printf("Type y value of the location as: %d\n",atoi(yytext));
Height          printf("Type Height as : %d\n",atoi(yytext));
StrokeWidth     printf("Type Stroke Widht\n");
Direction       printf("A direction as: %s\n",yytext);
Rounded         printf("Rounded as: %s\n",yytext);
Arrow           printf("Arrow as: %s\n",yytext);
ArrowSize       printf("Arrow Size as:%d \n",atoi(yytext));
RGB             printf("Type Color Set\n");

Rectangle       printf("Type Rectangle Shape\n");
Line            printf("Type Line Shape\n"); 
Oval            printf("Type Oval Shape\n");

Set             printf("Type Set\n");
Shape           printf("Type Shape\n");
\.fillColor     printf("fillColor Function\n");
\.fillState     printf("fillState Function\n");
shapeDrawing    printf("shapeDrawing Function\n");

\.CompositeShape     printf("Return CompositeShape\n");

parameter           printf("Type Parameter");
{string}            printf("A string as: %s\n",yytext);
{integer}           printf("An integer as: %d\n",atoi(yytext));
{summation}         printf("Summation as :\n");
{substraction}      printf("Substraction\n");
{multiplication}    printf("Multiplication\n");
{division}          printf("Division\n");

%%

int main() {
      yylex();
      return 0;
    }
 int yywrap() { return 1; }