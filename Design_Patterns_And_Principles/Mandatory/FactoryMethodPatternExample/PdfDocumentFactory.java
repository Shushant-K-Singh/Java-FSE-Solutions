package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class PdfDocumentFactory extends DocumentFactory{
    
    @Override
    public Document createDocument(){
        return new PdfDocument();
    }
}
