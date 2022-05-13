
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
    Brancos = {FimDeLinha} | [ \t\f]
    numero = [:digit:][:digit:]*
    identificador = [:lowercase:]
%%

    //Regras léxicas

<YYINITIAL>{

    {identificador} {return symbol(TokenType.ID);}
    {numero}        {return symbol(TokenType.NUM, Integer.parseInt(yytext()));}     
    "="             {return symbol(TokenType.EQ);}
    ";"             {return symbol(TokenType.SEMI);}
    "*"             {return symbol(TokenType.TIMES);}
    "+"             {return symbol(TokenType.PLUS);}
    {Brancos}       { /* Não faz nada*/ }
}

[^]                 {throw new RuntimeException("Illegal character <" + yytext() + ">"); }