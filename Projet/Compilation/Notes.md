parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

file
    : classDecl* classMain EOF
    ;

classDecl
    : CLASS IDENT (EXTENDS IDENT)? LBRACE decl* RBRACE
    ;

decl
    : type IDENT SEMI                             // field decl
    | constructor
    | method
    ;

constructor
    : IDENT LPAREN params? RPAREN LBRACE stmt* RBRACE
    ;

method
    : (type | VOID) IDENT LPAREN params? RPAREN LBRACE stmt* RBRACE
    ;

params
    : param (COMMA param)*
    ;

param
    : type IDENT
    ;

type
    : BOOLEAN
    | INT
    | IDENT
    | STRINGCLASS        // allow 'String' as a type in signatures (e.g., main)
    ;

classMain
    : CLASS MAINCLASS LBRACE PUBLIC STATIC VOID MAINMETHOD LPAREN STRINGCLASS IDENT LBRACK RBRACK RPAREN LBRACE stmt* RBRACE RBRACE
    ;

// statements
stmt
    : SEMI
    | expr SEMI
    | type IDENT SEMI
    | type IDENT ASSIGN expr SEMI
    | IF LPAREN expr RPAREN stmt (ELSE stmt)?
    | FOR LPAREN expr? SEMI expr? SEMI expr? RPAREN stmt
    | LBRACE stmt* RBRACE
    | RETURN expr? SEMI
    ;

// expressions with precedence (lowest -> highest)
expr
    : assignmentExpr
    ;

assignmentExpr
    : conditionalExpr (ASSIGN assignmentExpr)?     // right-associative assignment
    ;

conditionalExpr
    : logicalOrExpr
    ;

logicalOrExpr
    : logicalAndExpr (OR logicalAndExpr)*
    ;

logicalAndExpr
    : equalityExpr (AND equalityExpr)*
    ;

equalityExpr
    : relationalExpr ( (EQ | NEQ) relationalExpr )*
    ;

relationalExpr
    : additiveExpr ( (LT | LE | GT | GE) additiveExpr )*
      ( INSTANCEOF type )?
    ;

additiveExpr
    : multiplicativeExpr ( (PLUS | MINUS) multiplicativeExpr )*
    ;

multiplicativeExpr
    : unaryExpr ( (STAR | DIV | MOD) unaryExpr )*
    ;

unaryExpr
    : MINUS unaryExpr
    | NOT unaryExpr
    | castExpr
    ;

castExpr
    : LPAREN type RPAREN unaryExpr
    | postfixExpr
    ;

postfixExpr
    : primaryExpr (postfixPart)*
    ;

postfixPart
    : DOT IDENT                                 // field access
    | DOT IDENT LPAREN args? RPAREN             // method call on field/expr
    | LPAREN args? RPAREN                       // method call on primary expr (if any)
    ;

primaryExpr
    : INTLIT
    | STRINGLIT
    | TRUE
    | FALSE
    | THIS
    | NULL
    | LPAREN expr RPAREN
    | IDENT
    | IDENT LPAREN args? RPAREN                 // method call on IDENT
    | NEW IDENT LPAREN args? RPAREN             // new Class(args)
    ;

args
    : expr (COMMA expr)*
    ;


lexer grammar ExprLexer;

// ------------------------
// Lexer rules
// ------------------------

// Keywords (placed before IDENT so they're recognized as keywords)
BOOLEAN : 'boolean' ;
CLASS   : 'class' ;
ELSE    : 'else' ;
EXTENDS : 'extends' ;
FALSE   : 'false' ;
FOR     : 'for' ;
IF      : 'if' ;
INSTANCEOF : 'instanceof' ;
INT     : 'int' ;
NEW     : 'new' ;
NULL    : 'null' ;
PUBLIC  : 'public' ;
RETURN  : 'return' ;
STATIC  : 'static' ;
THIS    : 'this' ;
TRUE    : 'true' ;
VOID    : 'void' ;

// Note: 'String' and 'Main' appear with capitalization in the "main" class signature in the spec.
// We declare them as tokens to match exactly (and placed before IDENT).
STRINGCLASS : 'String' ;
MAINCLASS   : 'Main' ;

// The lowercase 'main' (method name) in "public static void main(...)" — match it as a token
MAINMETHOD  : 'main' ;

// Punctuation and Operators
SEMI    : ';' ;
COMMA   : ',' ;
DOT     : '.' ;
LPAREN  : '(' ;
RPAREN  : ')' ;
LBRACE  : '{' ;
RBRACE  : '}' ;
LBRACK  : '[' ;
RBRACK  : ']' ;

ASSIGN  : '=' ;
OR      : '||' ;
AND     : '&&' ;
EQ      : '==' ;
NEQ     : '!=' ;
LT      : '<' ;
LE      : '<=' ;
GT      : '>' ;
GE      : '>=' ;
PLUS    : '+' ;
MINUS   : '-' ;
STAR    : '*' ;
DIV     : '/' ;
MOD     : '%' ;
NOT     : '!' ;

// Literals and identifiers
INTLIT
    : '0'
    | [1-9] [0-9]*
    ;

STRINGLIT
    : '"' ( ESC_SEQ | ~["\\\r\n] )* '"'
    ;

// Keywords for 'boolean' and 'int' already mapped; but for parser convenience we used tokens BOOLEAN and INT.
// IDENT must come after keyword tokens so keywords are not captured as IDENT.
IDENT
    : [a-zA-Z_] [a-zA-Z0-9_]*
    ;

// Fragments for escape sequences in string literals
fragment
ESC_SEQ
    : '\\' [btnfr"'\\]
    | '\\' [0-3] [0-7] [0-7]    // octal (optional)
    ;

// Whitespace and comments (skipped)
LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;

BLOCK_COMMENT
    : '/*' .*? '*/' -> skip
    ;

WS
    : [ \t\r\n\u000C]+ -> skip
    ;
