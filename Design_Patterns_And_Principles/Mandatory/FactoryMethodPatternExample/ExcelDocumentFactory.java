package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class ExcelDocumentFactory extends DocumentFactory{
    
    @Override
    public Document createDocument(){
        return new ExcelDocument();
    }
}
