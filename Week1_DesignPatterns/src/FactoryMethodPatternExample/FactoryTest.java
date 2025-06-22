package FactoryMethodPatternExample;

class FactoryTest {
    public static void main(String[] args) {
        DocumentFactory factory = new WordFactory();
        Document doc = factory.createDocument();
        doc.open();

        factory = new PdfFactory();
        doc = factory.createDocument();
        doc.open();
    }
}
