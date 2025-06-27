package com.deep.skilling.junit_basic;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;

public class LifecycleTest {

    Calculator calc;

    @BeforeEach
    public void setup() {
        calc = new Calculator(); // Arrange
    }

    @AfterEach
    public void teardown() {
        calc = null;
    }

    @Test
    public void testAdd() {
        // Act
        int result = calc.add(2, 3);

        // Assert
        assertEquals(5, result);
    }

    @Test
    public void testMultiply() {
        assertEquals(12, calc.multiply(4, 3));
    }
}
