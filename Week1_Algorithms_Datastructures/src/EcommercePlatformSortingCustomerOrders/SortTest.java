package EcommercePlatformSortingCustomerOrders;

class SortTest {
    public static void main(String[] args) {
        Order[] orders = {
            new Order(101, "Alice", 1500.0),
            new Order(102, "Bob", 2500.0),
            new Order(103, "Charlie", 1200.0)
        };

        System.out.println("Sorting with Bubble Sort:");
        SortAlgorithms.bubbleSort(orders);
        for (Order o : orders) {
            System.out.println(o.customerName + ": Rs. " + o.totalPrice);
        }
    }
}