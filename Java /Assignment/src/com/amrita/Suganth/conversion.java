package com.amrita.Suganth;

import java.util.Scanner;
public class conversion {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter a number convert to binary and hex: ");
        int decimal = input.nextInt();
        System.out.println("The value in binary is: " + Integer.toBinaryString(decimal));
        System.out.println("The value in hexadecimal is: " + Integer.toHexString(decimal));
    }
}