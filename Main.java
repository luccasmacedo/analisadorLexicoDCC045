import java.io.FileReader;
import java.io.IOException;

import src.*;

public class Main {
    public static void main(String[] args) throws IOException {
        Lexer lx = new Lexer(new FileReader(args[0]));
        Token t = lx.nextToken();
        while(t != null){
            System.out.println(t.toString());
            t = lx.nextToken();
        }
        System.out.println("Total de tokens lidos: " + lx.readedTokens());
    }
}
