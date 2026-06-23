package com.shushant.services;
import org.juint.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class AssertExample {

    // Assertion :- validation of actual test cases with expected test cases
    @Test
    public void test1(){
        System.out.println("esting Some Assestion Methods");

        int actual = 2;
        int expected = 4;
        Assertions.assertEquals(expected, actual);

        int[] actualArray = {1,2,3,4,5};
        int[] expactedArray = {1,2,3,4,5};
        Assertions.assertArrayEquals(expectedArray, actualArray);

        String expectedName = new String("Ramu");
        String name = new name("ramu";)
        Assertions.assertSame(expectedName, name); // it only checks if both the objects are same or not . doesnt matter what values you are providing in object

    }
}
