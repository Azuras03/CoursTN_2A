File
 -> ClassDecl* MainClass EOF

ClassDecl
 -> 'class' ident ClassExtOpt '{' MemberDeclList '}'

ClassExtOpt
 -> 'extends' ident
   | ε

MemberDeclList
 -> (MemberDecl)*

MemberDecl
 -> Type ident MemberDeclTail
   | ident '(' ParamListOpt ')' Block    // constructeur

MemberDeclTail
 -> ';'                              // attribut
   | '=' Expr ';'                      // attribut initialisé
   | '(' ParamListOpt ')' Block        // méthode

ParamListOpt
 -> ParamList
   | ε

ParamList
 -> Param (',' Param)*

Param
 -> Type ident

Type
 -> 'boolean' | 'int' | ident

MainClass
 -> 'class' 'Main' '{'
        'public' 'static' 'void' 'main'
        '(' 'String' ident '[' ']' ')' Block
      '}'

Stmt
 -> ';'
   | Expr ';'
   | Type ident StmtVarTail
   | 'if' '(' Expr ')' Stmt StmtElseOpt
   | 'for' '(' ForInit ';' ForCond ';' ForIter ')' Stmt
   | '{' StmtList '}'
   | 'return' ExprOpt ';'

StmtVarTail
 -> '=' Expr ';'
   | ';'

StmtElseOpt
 -> 'else' Stmt
   | ε

StmtList
 -> (Stmt)*

ExprOpt
 -> Expr
   | ε

ForInit
 -> ExprOpt
ForCond
 -> ExprOpt
ForIter
 -> ExprOpt

Expr -> AssignExpr

AssignExpr -> OrExpr ( '=' AssignExpr )?          // droite-associatif

OrExpr -> AndExpr ( '||' AndExpr )*

AndExpr -> EqExpr ( '&&' EqExpr )*

EqExpr -> RelExpr ( ( '==' | '!=' ) RelExpr )*

RelExpr -> AddExpr ( ( '<' | '<=' | '>' | '>=' | 'instanceof' ) AddExpr )*

AddExpr -> MulExpr ( ( '+' | '-' ) MulExpr )*

MulExpr -> UnaryExpr ( ( '*' | '/' | '%' ) UnaryExpr )*

UnaryExpr -> ( '-' | '!' ) UnaryExpr
               | CastOrPostfix

CastOrPostfix -> '(' Type ')' UnaryExpr
               | Postfix

Postfix -> Primary PostfixSuffix*

PostfixSuffix -> '.' ident
               | '(' ArgListOpt ')'

Primary -> integer
               | string
               | 'true' | 'false'
               | 'this'
               | 'null'
               | '(' Expr ')'
               | ident
               | 'new' ident '(' ArgListOpt ')'

ArgListOpt -> ArgList
               | ε

ArgList -> Expr ( ',' Expr )*

Block
 -> '{' StmtList '}'