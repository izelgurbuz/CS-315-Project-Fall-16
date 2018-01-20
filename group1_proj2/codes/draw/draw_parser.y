// Define the tokens

%{
	#include <stdio.h>
	int yyparse();
	int yylex(void);
	void yyerror(char *);
	extern int yylineno;
	int errornumber = 0;
%}

%union
{
	char * stripp;
	int integer;
	float Float;
}
%token COMMENT
%token LEFT_BRACET
%token RIGTH_BRACET
%token LEFT_PARENTHESIS
%token RIGHT_PARENTHESIS
%token COMMA
%token LEFT_CURLYBRACKET
%token RIGHT_CURLYBRACKET
%token ASSIGMENT_OPERATOR
%token SUMMATION_OPERATOR
%token SUBSTRACTION_OPERATOR
%token MULTIPICATION_OPERATOR
%token DIVISION_OPERATOR
%token EQUALS_TO_INDICATOR
%token NOT_EQUALS_TO_INDICATOR
%token LESS_THAN_INDICATOR
%token GREATHER_THAN_INDICATOR
%token FLOAT
%token INTEGER
%token IDENTIFIER
%token WIDTH
%token HEIGHT
%token STROKE_WIDTH
%token DEF_WIDTH
%token DEF_HEIGHT
%token RECTANGLE
%token LINE
%token OVAL
%token COMPOSITE_SHAPE
%token SHAPE
%token PARAMETER
%token LOCATION
%token COLOR
%token SET
%token DIRECTION
%token BOOLEAN
%token BEGIN_OF_MAIN
%token END_OF_MAIN
%token DRAW_FNC
%token FILL_COLOR_FNC
%token FILL_STATE_FNC



%type <integer> INTEGER
%type <float> FLOAT
%type <string> IDENTIFIER


%%

program : BEGIN_OF_MAIN stmt END_OF_MAIN;



stmt : def_stmt
				| assignment_stmt
				| logic_stmt
				| comment_stmt
				;

def_stmt : data_type identifier
					;

data_type : INTEGER
						| FLOAT
						| WIDTH
						| HEIGHT
						| STROKE_WIDTH
						| DEF_WIDTH
						| DEF_HEIGHT
						| RECTANGLE
						| LINE
						| OVAL
						| COMPOSITE_SHAPE
						| SHAPE
					    | PARAMETER
						| LOCATION
						| COLOR
						| SET
						| DIRECTION
						| BOOLEAN;

identifier : 
						 IDENTIFIER assignment_stmt
						| IDENTIFIER function_callers;

assignment_stmt : ASSIGMENT_OPERATOR cshape;

cshape	: 	IDENTIFIER SUMMATION_OPERATOR IDENTIFIER
			| SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER
			| SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER
			| IDENTIFIER ERROR_NO_1
			| ERROR_NO_2
			| ERROR_NO_3
			| ERROR_NO_4
			| ERROR_NO_5;

ERROR_NO_1 : SUMMATION_OPERATOR SUMMATION_OPERATOR  {printf("%s, lineNumber: %d\n", "***ERROR***: YOU NEED TO USE IDENTIFIER BETWEEN SUMMATION OPERATIONS!", yylineno);}
;
ERROR_NO_2 : IDENTIFIER IDENTIFIER  {printf("%s, lineNumber: %d\n", "***ERROR***: YOU NEED TO USE SUMMATION_OPERATOR BETWEEN IDENTIFIERS!", yylineno);}
;
ERROR_NO_3 : IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER SUMMATION_OPERATOR IDENTIFIER {printf("%s, lineNumber: %d\n", "***ERROR***: YOU CAN CONCATINATE AT MOST 4 SHAPES AT A TIME!", yylineno);}
;
ERROR_NO_4 : INTEGER  {printf("%s, lineNumber: %d\n", "***ERROR***: YOU CANNOT USE INTEGERS IN ASSIGMENT OF COMPOSITE SHAPE", yylineno);}
;
ERROR_NO_5 : IDENTIFIER  {printf("%s, lineNumber: %d\n", "***ERROR***: YOU NEED TO USE AT LEAST 2 SHAPES IN ASSIGMENT OF COMPOSITE SHAPE", yylineno);}
	;

function_callers:  DRAW_FNC
				  |   FILL_STATE_FNC
				  |  FILL_COLOR_FNC;


logic_stmt :  expr  
		   |  expr logical_op
		   |  expr logical_op expr
		   ;
		   
comment_stmt : COMMENT stmt
		   	 ;

expr    : identifier  
		| function_callers
	    ;

logical_op : EQUALS_TO_INDICATOR | NOT_EQUALS_TO_INDICATOR  | LESS_THAN_INDICATOR |GREATHER_THAN_INDICATOR | ASSIGMENT_OPERATOR ;
		   ;


%%
int main() 
{
  int ret = yyparse();
  if (ret!=0)
    return EXIT_FAILURE;
  return EXIT_SUCCESS;
}


%{
   #include <stdio.h>
   void yyerror(const char* msg) {
      fprintf(stderr, "%s\m", msg);
   }
   int yylex();
%}
