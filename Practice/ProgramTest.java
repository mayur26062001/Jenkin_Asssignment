package Practice;

import static org.junit.Assert.*;
import org.junit.Test;

public class ProgramTest {

    @Test
    public void testDivideNormalCase() {
        Program p = new Program();
        int result = p.divide(10, 2);
        System.out.println("Test: testDivideNormalCase - Result: " + result);
        assertEquals(5, result);
    }

    @Test(expected = ArithmeticException.class)
    public void testDivideByZero() {
        Program p = new Program();
        try {
            p.divide(10, 0);
        } catch (ArithmeticException e) {
            System.out.println("Test: testDivideByZero - Expected exception caught: " + e.getMessage());
            throw e; // rethrow to allow the test to pass
        }
    }
}
