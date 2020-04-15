#ifndef TOKEN_H
#define TOKEN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin, *yyout;

typedef enum eTOKENS
{
	
	//numbers
	INT_NUM_TOK,
	FLOAT_NUM_TOK,

	//operations
	AR_OP_TOK,
	PLUS_OP_TOK,
	MULT_OP_TOK,
	INV_OP_TOK,
	SML_THAN_OP_TOK,
	SML_EQL_THAN_OP_TOK,
	EQUAL_OP_TOK,
	LRG_EQL_THAN_OP_TOK,
	LRG_THAN_OP_TOK,
	NOT_EQUAL_OP_TOK,
	AS_OP_TOK,


	//identifiers
	ID_TOK,

	//keywords
	INT_KW_TOK,
	FLOAT_KW_TOK,
	VOID_KW_TOK,
	IF_KW_TOK,
	RETURN_KW_TOK,

	//seperation signs
	COMMA_SIGN_TOK,
	COLON_SIGN_TOK,
	SEMI_COLON_SIGN_TOK,
	RO_BRAC_OPEN_TOK,
	CU_BRAC_OPEN_TOK,
	SQ_BRAC_OPEN_TOK,
	RO_BRAC_CLOSE_TOK,
	CU_BRAC_CLOSE_TOK,
	SQ_BRAC_CLOSE_TOK,

	//EOF
	EOF_TOK	

}eTOKENS;

//char *eTokensString[] = {
//
//	//numbers
//	"INT_NUM",
//	"FLOAT_NUM",
//
//	//operations
//	"AR_OP",
//	"REL_OP",
//	"ASSIGNMENT_OP",
//
//	//identifiers
//	"ID"
//
//	//keywords
//
//	//seperation signs
//
//	//comments
//
//};

typedef struct Token
{
	eTOKENS kind;
	char *lexeme;
	int lineNumber;
}Token;

typedef struct Node
{
	Token *tokensArray;
	struct Node *prev;
	struct Node *next;
} Node;

void create_and_store_token(eTOKENS kind, char* lexeme, int numOfLine);
Token *next_token();
Token *back_token();

#endif