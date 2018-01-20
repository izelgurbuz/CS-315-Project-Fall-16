%option yylineno

%{
	//#include <cstdlib>
	//#include <iostream>
	
	void yyerror(char *);
	
%}

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

\[              {return LEFT_BRACET;}
\]              {return RIGHT_BRACET;}
\(              {return LEFT_PARENTHESIS;}
\)              {return RIGHT_PARENTHESIS;}
\,              {return COMMA;}
\{              {return LEFT_CURLYBRACKET;}
\}              {return RIGHT_CURLYBRACKET;}
\=              {return ASSIGMENT_OPERATOR;}
\+              {return SUMMATION_OPERATOR;}
\-              {return SUBSTRACTION_OPERATOR;}
\*              {return MULTIPICATION_OPERATOR;}
\/              {return DIVISION_OPERATOR;}
\=\=            {printf("%s\n", "Equal to indicator"); return EQUAL_TO_INDICATOR;}
!\=             {printf("%s\n", "Not equal to indicator"); return NOT_EQUAL_TO_INDICATOR;}
\<              {return LESS_THAN_INDICATOR;}
\>              {return GREATHER_THAN_INDICATOR;}
begin           {printf("%s\n", "Beginning Of Program"); return BEGIN_OF_MAIN;}
end             {printf("%s\n", "Ending Of Program"); return END_OF_MAIN;}



draw.			{printf("%s\n", "Draw function call"); return DRAW_FNC;}
drawDefault.	{printf("%s\n", "Draw default function call"); return DRAW_DEFAULT_FNC;}

\.location      {printf("%s\n", "Location type call"); return LOCATION_FNC;}
\.size          {printf("%s\n", "Size type call"); return SIZE_FNC;}
\.color         {printf("%s\n", "Color type call"); return COLOR_FNC;}
\.strokeWidth   {printf("%s\n", "StrokeWidth type call"); return STROKE_WIDTH_FNC;}
\.width         {printf("%s\n", "Width type call"); return WIDTH_FNC;}
\.xValue        {printf("%s\n", "xValue type call"); return X_VALUE_FNC;}
\.yValue        {printf("%s\n", "yValue type call"); return Y_VALUE_FNC;}
\.height        {printf("%s\n", "Height type call"); return HEIGHT_FNC;}
\.direction     {printf("%s\n", "Direction type call"); return DIRECTION_FNC;}
\.rounded       {printf("%s\n", "Rounded type call"); return ROUNDED_FNC;}
\.arrow         {printf("%s\n", "Arrow type call"); return ARROW_FNC;}
\.arrowSize     {printf("%s\n", "arrowSize type call"); return ARROW_SIZE_FNC;}


Width           {printf("%s\n", "Type width"); return WIDTH;}
xValue          {printf("%s\n", "Type height"); return X_VALUE;}
yValue          {printf("%s\n", "Type xValue"); return Y_VALUE;}
Height          {printf("%s\n", "Type yValue"); return HEIGHT;}
StrokeWidth     {printf("%s\n", "Type StrokeWidth"); return STROKE_WIDTH;}
Direction       {printf("%s\n", "Type Direction"); return DIRECTION;}
Rounded         {printf("%s\n", "Type Rounded"); return ROUNDED;}
Arrow           {printf("%s\n", "Type Arrow"); return ARROW;}
ArrowSize       {printf("%s\n", "Type ArrowSize"); return ARROW_SIZE;}
RGB             {printf("%s\n", "Type RGB"); return RGB;}

Rectangle       {printf("%s\n", "Type Rectangle"); return RECTANGLE;}
Line            {printf("%s\n", "Type Line"); return LINE;} 
Oval            {printf("%s\n", "Type Oval"); return OVAL;}

Set             {printf("%s\n", "Type Set"); return SET;}
Shape           {printf("%s\n", "Type Shape"); return SHAPE;}
\.fillColor     {printf("%s\n", "Fill color function call"); return FILL_COLOR_FNC;}
\.fillState     {printf("%s\n", "Fill state function call"); return FILL_sTATE_FNC;}
shapeDrawing    {printf("%s\n", "Type shapeDrawing"); return SHAPE_DRAWING;}

\.CompositeShape     {printf("%s\n", "Composite shape type call"); return COMPOSITE_SHAPE_FNC;}

parameter           printf("Type Parameter");
{identifier}        {yylval.stripp = strdup(yytext); return IDENTIFIER;}
{integer}           {yylval.integer = atoi(yytext); return INTEGER;}
{summation}        	{printf("%s\n", "Summation operator"); return SHAPE_DRAWING;}
{substraction}     	{printf("%s\n", "Sunstraction operator"); return SHAPE_DRAWING;}
{multiplication}    {printf("%s\n", "Multipication operator"); return SHAPE_DRAWING;}
{division}          {printf("%s\n", "Division operator"); return SHAPE_DRAWING;}

%%

 int yywrap() { return 1; }