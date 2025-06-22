package FactoryMethodPatternExample;

class WordFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}