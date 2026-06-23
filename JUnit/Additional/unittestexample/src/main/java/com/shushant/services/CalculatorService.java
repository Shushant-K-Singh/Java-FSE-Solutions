package com.shushant.services;

public class CalculatorService {
    public static int addTwoNumbers(int a, int b){
        return a+b;
    }

    public static int productTwoNumbers(int a, int b){
        return a*b;
    }

    public static double divideTwoNumbers(int a, int b){
        return a/b;
    }

    public static int addAnyNumbers(int ...numbers){
        int sum = 0;
        for(int n : numbers){
            sum += n;
        }
        return sum;
    }    
}
