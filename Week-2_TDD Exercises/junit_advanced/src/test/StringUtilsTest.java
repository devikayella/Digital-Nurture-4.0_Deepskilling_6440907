package com.deep.skilling.junit_advanced;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class StringUtilsTest {

    @Test
    public void testToUpper() {
        System.out.println("Running StringUtilsTest.testToUpper");
        assertEquals("HELLO", "hello".toUpperCase());
    }

    @Test
    public void testTrim() {
        System.out.println("Running StringUtilsTest.testTrim");
        assertEquals("hello", "  hello  ".trim());
    }
}
