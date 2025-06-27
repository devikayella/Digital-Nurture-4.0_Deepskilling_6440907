package com.deep.skilling.junit_advanced;

import org.junit.platform.suite.api.SelectClasses;
import org.junit.platform.suite.api.Suite;

@Suite
@SelectClasses({
    MathUtilsTest.class,
    StringUtilsTest.class
})
public class AllTests {
    // This class remains empty; it's used only as a holder for the above annotations.
}
