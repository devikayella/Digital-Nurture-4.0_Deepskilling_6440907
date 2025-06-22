package FinancialForecasting;

class ForecastCalculator {
    static double predictValue(double base, double rate, int years) {
        if (years == 0) return base;
        return (1 + rate) * predictValue(base, rate, years - 1);
    }

    public static void main(String[] args) {
        double future = predictValue(10000, 0.05, 5);
        System.out.println("Future Value after 5 years: Rs. " + future);
    }
}
