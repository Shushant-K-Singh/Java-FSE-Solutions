package com.shushant;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;


public class AssertionTest {
    @Test
    public void testAssertions(){
        assertEquals(5,2+3);

        assertTrue(5>3);
        assertFalse(5<3);

        assertNull(null);
        assertNotNull(new Object());

        String str = "JUnit";
        String sameStr = str;
        assertSame(str,sameStr);

        assertNotSame(new String("JUnit"), new String("JUnit"));

        assertThrows(ArithmeticException.class, () -> {
            int result = 10 / 0;
        });
    }
}
