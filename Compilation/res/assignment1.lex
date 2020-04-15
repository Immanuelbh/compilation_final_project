%{
#include <Token.h>

int line_num = 1;
int BRAC_RO = 0;
int BRAC_CU = 0;
int BRAC_SQ = 0;

%}

%x comment1 comment2
DIGIT [0-9]
LO_CASE [a-z]
UP_CASE [A-Z]
ALPHANUM ({LO_CASE}|{UP_CASE}|{DIGIT})
PLUS_OP "+"
MULT_OP "*"
INV_OP ("-"|"/")
SML_THAN_OP "<"
SML_EQL_THAN_OP "<="
EQUAL_OP "=="
LRG_EQL_THAN_OP ">="
LRG_THAN_OP ">"
NOT_EQUAL_OP "!="
AS_OP "="
INT_KW "int"
FLOAT_KW "float"
VOID_KW "void"
IF_KW "if"
RETURN_KW "return"
COMMA_SIGN ","
COLON_SIGN ":"
SEMI_COLON_SIGN ";"
RO_BRAC_OPEN "("
CU_BRAC_OPEN "{"
SQ_BRAC_OPEN "["
RO_BRAC_CLOSE ")"
CU_BRAC_CLOSE "}"
SQ_BRAC_CLOSE "]"
SPACE [ \t]+

%%
"*/"				{	fprintf(yyout, "!ERR >> Type 'INV_COMMENT' on line %d : '%s'\n", line_num, yytext);	return -1;	}
"/*"				BEGIN(comment1);
<comment1>"*/"		BEGIN(0);
<comment1>\n		{ line_num++; }
<comment1><<EOF>>	{	printf("!ERR >> File ended unexpectedly on line %d \n", line_num); fprintf(yyout, "!ERR >> File ended unexpectedly on line %d \n", line_num); line_num = 1; return 0;	}
<comment1>.			;

"//"				BEGIN(comment2);
<comment2>\n		{ line_num++; BEGIN(0); }
<comment2>.			;

<<EOF>>				{ line_num = 1; return 0;	}


\n											{	line_num++; }
{RO_BRAC_CLOSE}								{	create_and_store_token(RO_BRAC_CLOSE_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'RO_BRAC_CLOSE_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{CU_BRAC_CLOSE}								{	create_and_store_token(CU_BRAC_CLOSE_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'CU_BRAC_CLOSE_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{SQ_BRAC_CLOSE}								{	create_and_store_token(SQ_BRAC_CLOSE_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'SQ_BRAC_CLOSE_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{RO_BRAC_OPEN}								{	create_and_store_token(RO_BRAC_OPEN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'RO_BRAC_OPEN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{CU_BRAC_OPEN}								{	create_and_store_token(CU_BRAC_OPEN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'CU_BRAC_OPEN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{SQ_BRAC_OPEN}								{	create_and_store_token(SQ_BRAC_OPEN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'SQ_BRAC_OPEN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{COMMA_SIGN}								{	create_and_store_token(COMMA_SIGN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'COMMA_SIGN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{COLON_SIGN}								{	create_and_store_token(COLON_SIGN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'COLON_SIGN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{SEMI_COLON_SIGN}							{	create_and_store_token(SEMI_COLON_SIGN_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'SEMI_COLON_SIGN_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{INV_OP}									{	fprintf(yyout, "!ERR >> Type 'INV_OP' on line %d : '%s'\n", line_num, yytext);
												return -1; }
{AS_OP}										{	create_and_store_token(AS_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'AS_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{SML_THAN_OP}								{	create_and_store_token(SML_THAN_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'SML_THAN_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{SML_EQL_THAN_OP}							{	create_and_store_token(SML_EQL_THAN_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'SML_EQL_THAN_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{EQUAL_OP}									{	create_and_store_token(EQUAL_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'EQUAL_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{LRG_EQL_THAN_OP}							{	create_and_store_token(LRG_EQL_THAN_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'LRG_EQL_THAN_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{LRG_THAN_OP}								{	create_and_store_token(LRG_THAN_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'LRG_THAN_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{NOT_EQUAL_OP}								{	create_and_store_token(NOT_EQUAL_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'NOT_EQUAL_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{PLUS_OP}									{	create_and_store_token(PLUS_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'PLUS_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{MULT_OP}									{	create_and_store_token(MULT_OP_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'MULT_OP_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
0{DIGIT}+									{	fprintf(yyout, "!ERR >> Type 'INV_NUM' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}
{DIGIT}+(e|E){DIGIT}+						{	fprintf(yyout, "!ERR >> Type 'INV_FLOAT_NUM' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}
0|[1-9]{DIGIT}*								{	create_and_store_token(INT_NUM_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'INT_NUM_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
 											}
0{DIGIT}+"."{DIGIT}+((e|E)("+"|"-")?{DIGIT}+)?	{	fprintf(yyout, "!ERR >> Type 'INV_FLOAT_NUM' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}
{DIGIT}+"."{DIGIT}+((e|E)("+"|"-")?0{DIGIT}+)?	{	fprintf(yyout, "!ERR >> Type 'INV_FLOAT_NUM' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}
{DIGIT}+"."{DIGIT}+(e|E)("+"|"-")?{DIGIT}+		{	create_and_store_token(FLOAT_NUM_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'FLOAT_NUM_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{INT_KW}									{	create_and_store_token(INT_KW_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'INT_KW_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{FLOAT_KW}									{	create_and_store_token(FLOAT_KW_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'FLOAT_KW_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{VOID_KW}									{	create_and_store_token(VOID_KW_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'VOID_KW_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{IF_KW}										{	create_and_store_token(IF_KW_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'IF_KW_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{RETURN_KW}									{	create_and_store_token(RETURN_KW_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'RETURN_KW_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
({UP_CASE}+|"_"+)+{ALPHANUM}*				{	fprintf(yyout, "!ERR >> Type 'INV_ID' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}	
{LO_CASE}+{ALPHANUM}*						{	create_and_store_token(ID_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'ID_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
{LO_CASE}+({ALPHANUM}*"__"+{ALPHANUM}+)*	{	fprintf(yyout, "!ERR >> Type 'INV_ID' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}
{LO_CASE}+({ALPHANUM}*"_"{ALPHANUM}+)*		{	create_and_store_token(ID_TOK, yytext, line_num); 
												fprintf(yyout, "Line %d : found 'ID_TOK' , lexeme '%s'\n", line_num, yytext);  
												return 1;
											}
({LO_CASE}|{UP_CASE}|{DIGIT})+"_"+			{	fprintf(yyout, "!ERR >> Type 'INV_ID_UND_SCORE' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}	
{SPACE}										;
.											{	fprintf(yyout, "!ERR >> Type 'INV_TOK' on line %d : '%s'\n", line_num, yytext);
												return -1; 
											}	
%%
//#define _CRT_SECURE_NO_WARNINGS
int yywrap() {return 1;}
void main(int argc, char* argv[])
{
	printf("---- Assignment 1 ----\n");
	printf("#### Test 1 Starting ####\n");
	yyin = fopen("C:\\temp\\test1.txt","r");
	if(yyin == NULL) {
		perror("Error opening file: 'test1.txt'\n");
	}
	yyout = fopen("C:\\temp\\test1_309991644_lex.txt", "w");
	if(yyout == NULL) {
		perror("Error opening file: 'test1_309991644_lex.txt'\n");
	}
	if(yyin != NULL && yyout != NULL) {
		printf("Test1 running...\n");
		while (yylex() != 0) { }
	}
	printf("@@@@ Test 1 Completed @@@@\n");
	
	printf("#### Test 2 Starting ####\n");
	yyin = fopen("C:\\temp\\test2.txt", "r");
	if(yyin == NULL) {
		perror("Error opening file: 'test2.txt'\n");
	}
	yyout = fopen("C:\\temp\\test2_309991644_lex.txt", "w");
	if(yyout == NULL) {
		perror("Error opening file: 'test2_309991644_lex.txt'\n");
	}
	if(yyin != NULL && yyout != NULL) {
		printf("Test2 running...\n");
		while (yylex() != 0) { }
	}
	printf("@@@@ Test 2 Completed @@@@\n");

}
