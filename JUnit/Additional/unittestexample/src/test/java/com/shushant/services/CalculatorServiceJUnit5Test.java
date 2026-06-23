package com.shushant.services;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class CalculatorServiceJUnit5Test {

    @BeforeAll
    public static void init(){
        System.out.println("This is single time logic");
    } 

    @BeforeEach
    @DisplayName("This Is Custom Name") //we can give names to methods
    public void eachTestCase(){
        System.out.println("Before Each Test Case");
    }
    
    @Test
    public void addTwoNumbersTest(){
        int result = CalculatorService.addTwoNumbers(8,2);
        Assertions.assertEquals(10, result, "Test Failed");
    }

    @Test
    @Disabled // we candisable any test
    public void addAnyNumbers(){

        int sum = CalculatorService.addAnyNumbers(2,6,8,10);
        Assertions.assertEquals(26, sum, "Test Failed");
    }

    @AfterEach
    public void afterTestCase(){
        System.out.println("After Each Test Case");
    }

    @AfterAll
    public static void cleanup(){
        System.out.println("this will execute after all tests");
    }
}
