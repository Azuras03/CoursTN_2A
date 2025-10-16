〈file〉 ::= 〈class〉* 〈class_Main〉EOF

〈class〉 ::= class 〈ident〉(extends 〈ident〉)? { decl* }

〈decl〉 ::= 〈type〉〈ident〉; | 〈constructor〉 | 〈method〉

〈constructor〉 ::= 〈ident〉( 〈params〉? ) { 〈stmt〉* }

〈method〉 ::= (〈type〉 | void) 〈ident〉( 〈params〉? ) { 〈stmt〉* }

〈params〉 ::= 〈type〉〈ident〉 
    | 〈type〉〈ident〉, 〈params〉

〈type〉 ::= boolean 
    | int 
    | 〈ident〉

〈class_Main〉 ::= class Main {
        public static void main(String 〈ident〉[]) { 〈stmt〉* }
    }

〈expr〉 ::= 〈integer〉 | 〈string〉 | true | false
    | this
    | null
    | ( 〈expr〉)
    | 〈ident〉
    | 〈expr〉. 〈ident〉
    | 〈ident〉= 〈expr〉
    | 〈expr〉. 〈ident〉= 〈expr〉
    | 〈ident〉( 〈lexpr〉? )
    | 〈expr〉. 〈ident〉( 〈lexpr〉? )
    | new 〈ident〉( 〈lexpr〉? )
    | ! 〈expr〉
    |- 〈expr〉
    | 〈expr〉〈binop〉〈expr〉
    | ( 〈type〉) 〈expr〉
    | 〈expr〉instanceof 〈type〉

〈binop〉 ::= == 
    | != 
    | < 
    | <= 
    | > 
    | >= 
    | + 
    |- 
    | * 
    | / 
    | % 
    | && 
    | |
    |

〈lexpr〉 ::= 〈expr〉
    | 〈expr〉, 〈lexpr〉

〈stmt〉 ::= ;
    | 〈expr〉;
    | 〈type〉〈ident〉;
    | 〈type〉〈ident〉= 〈expr〉;
    | if ( 〈expr〉) 〈stmt〉
    | if ( 〈expr〉) 〈stmt〉else 〈stmt〉
    | for ( 〈expr〉? ; 〈expr〉? ; 〈expr〉? ) 〈stmt〉
    | { 〈stmt〉* }
    | return 〈expr〉? ;