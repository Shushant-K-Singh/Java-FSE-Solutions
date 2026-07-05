import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArrangeActAssert {
    @BeforeEach
    void setUp() {
        System.out.println("Setup method executed");
    }

    @AfterEach
    void tearDown() {
        System.out.println("Teardown method executed");
    }

    @Test
    void testAddition() {

        int a = 2;
        int b = 3;
        int result = a + b;
        assertEquals(5, result);
    }   
}
