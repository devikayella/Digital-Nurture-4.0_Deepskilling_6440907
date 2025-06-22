package StrategyPatternExample;

class StrategyTest {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext(new CreditCardPayment());
        context.pay(500);

        context = new PaymentContext(new PayPalPayment());
        context.pay(300);
    }
}