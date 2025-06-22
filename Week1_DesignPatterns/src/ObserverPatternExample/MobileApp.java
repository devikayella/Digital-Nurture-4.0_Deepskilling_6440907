package ObserverPatternExample;

class MobileApp implements Observer {
    public void update(float price) {
        System.out.println("MobileApp - New Price: " + price);
    }
}