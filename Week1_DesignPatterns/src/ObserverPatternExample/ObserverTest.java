package ObserverPatternExample;

class ObserverTest {
    public static void main(String[] args) {
        StockMarket stock = new StockMarket();
        Observer app = new MobileApp();
        stock.register(app);
        stock.setPrice(100.5f);
        stock.setPrice(101.0f);
    }
}
