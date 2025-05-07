package Practice;
import static org.junit.Assert.*;
import org.junit.Test;

public class ProgramTest {

    @Test
    public void testDivideNormalCase() {
        Program p = new Program();
        assertEquals(5, p.divide(10, 2));
    }

    @Test(expected = ArithmeticException.class)
    public void testDivideByZero() {
        Program p = new Program();
        p.divide(10, 0); // should throw ArithmeticException
    }
}
