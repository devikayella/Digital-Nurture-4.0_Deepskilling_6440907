package com.deep.skilling.junit_advanced;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class MathUtilsTest {

    @Test
    public void testAdd() {
        System.out.println("Running MathUtilsTest.testAdd");
        assertEquals(4, 2 + 2);
    }

    @Test
    public void testMultiply() {
        System.out.println("Running MathUtilsTest.testMultiply");
        assertEquals(9, 3 * 3);
    }
}
