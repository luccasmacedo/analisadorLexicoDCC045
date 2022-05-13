public class Token {
    public int l, c;
    public TokenType type;
    public String lexeme;
    public Object info;

    public Token(TokenType type, String lexeme, Object info, int l, int c) {
        this.l = l;
        this.c = c;
        this.type = type;
        this.lexeme = lexeme;
        this.info = info;
    }

    public Token(TokenType type, String lexeme, int l, int c) {
        this.l = l;
        this.c = c;
        this.type = type;
        this.lexeme = lexeme;
    }

    public Token(TokenType type, Object info, int l, int c) {
        this.l = l;
        this.c = c;
        lexeme = "";
        this.type = type;
        this.info = info;
    }

    @Override
    public String toString() {
        return "[(" + l + " ," + c + ") \"" + lexeme + "\" : <" + (info == null ? "" : info.toString()) + ">]";
    }
}
