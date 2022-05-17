/*Autores: Fernando Dellão Menini 201935005,
           Luccas de Macedo Sodré 201535013
*/
    //Codigo do Usuário

%%

    //Opções e declarações

%unicode
%line
%column
%class Lexer
%function nextToken
%type Token

%{
    //Inserção de código arbitrário

    private int ntk;

    public int readedTokens(){
        return ntk;
    }

    private Token symbol(TokenType t){
        ntk++;
        return new Token(t, yytext(), yyline + 1, yycolumn + 1);
    }

    private Token symbol(TokenType t, Object value){
        ntk++;
        return new Token(t, value, yyline + 1, yycolumn + 1);
    }
%}

    //Inserção de código no construtor

%init{
    ntk = 0;
%init}

    //Definição de Macros

    FimDeLinha = \r|\n|\r\n
    Brancos = {FimDeLinha} | [\ \t\f]
    int = 0 | [1-9][:digit:]*
    float = 0 | [1-9]*[.][0-9]+
    variable_id = [:lowercase:][:jletterdigit: | '_']*
		type_id = [:uppercase:][:jletterdigit: | '_']*
    LineComment = "--" (.)* {FimDeLinha}
    char = '[:lowecase:]' | '\\[n | t | b | r | ' | \\]'
    dot = [.]
//		logico = true|false

    /* Agora vamos definir algumas macros */

%state COMMENT

%%

    //Regras léxicas

<YYINITIAL>{

    "if"					{ return symbol(TokenType.IF);   									}
		"else"		    { return symbol(TokenType.ELSE); 									}
    "true"		    { return symbol(TokenType.TRUE); 									}
    "false"		    { return symbol(TokenType.FALSE);  								}
    "iterate" 		{ return symbol(TokenType.ITERATE);								}
    "read"				{ return symbol(TokenType.READ);   							 	}
    "print"		    { return symbol(TokenType.PRINT);  								}
    "return" 			{ return symbol(TokenType.RETURN); 								}
    "null" 				{ return symbol(TokenType.NULL);  								}
    "new" 				{ return symbol(TokenType.NEW);  									}
    {variable_id} { return symbol(TokenType.VARIABLE_ID);  					}
    {type_id} 		{ return symbol(TokenType.TYPE_ID);				  			}
    {int}       	{ return symbol(TokenType.INT);  									}
    {float}       { return symbol(TokenType.FLOAT);  								}
    {char}       	{ return symbol(TokenType.CHAR);  								}
    {dot}       	{ return symbol(TokenType.DOT);	  								}
		{Brancos}     {																									}
    ")"           { return symbol(TokenType.RIGHT_PARENTHESIS);    	}
    "["           { return symbol(TokenType.LEFT_SQUARE_BRACKETS);  }
    "]"           { return symbol(TokenType.RIGHT_SQUARE_BRACKETS); }
    "{"           { return symbol(TokenType.LEFT_CURLY_BRACES);     }
    "}"           { return symbol(TokenType.RIGHT_CURLY_BRACES);    }
		">"           { return symbol(TokenType.GREATER_THAN);      		}
		";"           { return symbol(TokenType.SEMI);      						}
		"."           { return symbol(TokenType.DOT);      							}
		","           { return symbol(TokenType.COMMA);      						}
    "::"          { return symbol(TokenType.TYPE_DEFINITION);     	}
		"="           { return symbol(TokenType.EQ);      							}
    "<"           { return symbol(TokenType.LESS_THAN);      				}
    "=="          { return symbol(TokenType.EQUAL_TO);     					}
    "!="          { return symbol(TokenType.DIFFERENT);     				}
  	"+"           { return symbol(TokenType.PLUS);   								}
  	"-"           { return symbol(TokenType.MINUS);      						}
  	"*"           { return symbol(TokenType.TIMES);      						}
  	"/"           { return symbol(TokenType.DIVISION);      				}
  	"%"           { return symbol(TokenType.MODULUS);      					}
  	"&&"          { return symbol(TokenType.LOGICAL_AND);    				}
  	"!"           { return symbol(TokenType.LOGICAL_NOT);      			}
    "{-"          { yybegin(COMMENT);             									}
    {LineComment} {                               									}
}

<COMMENT>{
   "{-"     { yybegin(YYINITIAL); }
	 [^"-}"]  {                     }
}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }
