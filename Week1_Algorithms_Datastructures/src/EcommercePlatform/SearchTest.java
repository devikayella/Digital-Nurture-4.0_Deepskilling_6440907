package EcommercePlatform;

class SearchTest {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Book", "Education"),
            new Product(2, "Laptop", "Electronics"),
            new Product(3, "Shoes", "Fashion")
        };

        // Binary Search needs sorted data
        java.util.Arrays.sort(products, java.util.Comparator.comparing(p -> p.productName));

        System.out.println("Linear Search (Shoes): " + SearchAlgorithms.linearSearch(products, "Shoes"));
        System.out.println("Binary Search (Shoes): " + SearchAlgorithms.binarySearch(products, "Shoes"));
    }
}