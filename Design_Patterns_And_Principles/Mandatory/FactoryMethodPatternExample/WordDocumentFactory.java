package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class WordDocumentFactory extends DocumentFactory{
    
    @Override
    public Document documentObject(){
        return new WordDocument();
    }
}
