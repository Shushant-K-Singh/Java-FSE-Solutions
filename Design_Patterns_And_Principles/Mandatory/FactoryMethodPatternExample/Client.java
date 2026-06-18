package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class Client {
    public static void main(String[] args) {
        DocumentFactory d1 = new PdfDocumentFactory();
        Document pdf = d1.createDocument();
        pdf.create();
    }
}
