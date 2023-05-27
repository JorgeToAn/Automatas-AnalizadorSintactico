package com.proyecto;

import java.io.BufferedReader;
import java.io.FileReader;

public class App 
{
    public static void main( String[] args )
    {
        try {
            FileReader in = new FileReader("programa.txt");
            BufferedReader bf = new BufferedReader(in);
            Lexer lexer = new Lexer(bf);
            Parser p = new Parser(lexer);
            p.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
