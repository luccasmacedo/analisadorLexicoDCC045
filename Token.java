public class Token {
    public int l, c;
    public TokenType type;
    public String lexeme;
    public Object info;

    public Token(int l, int c, TokenType type, String lexeme, Object info) {
        this.l = l;
        this.c = c;
        this.type = type;
        this.lexeme = lexeme;
        this.info = info;
    }

    public Token(int l, int c, TokenType type, String lexeme) {
        this.l = l;
        this.c = c;
        this.type = type;
        this.lexeme = lexeme;
    }

    public Token(int l, int c, TokenType type, Object info) {
        this.l = l;
        this.c = c;
        this.type = type;
        this.info = info;
    }

    @Override
    public String toString() {
        return "[(" + l + " ," + c + ") \"" + lexeme + "\" : <" + (info == null ? "" : info.toString()) + ">]";
    }
}
