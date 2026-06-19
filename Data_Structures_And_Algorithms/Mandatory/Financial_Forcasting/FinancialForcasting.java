package Data_Structures_And_Algorithms.Mandatory.Financial_Forcasting;

public class FinancialForcasting {
    public static double predictValue(double currentValue, double growthRate, int years){

        if(years == 0){
            return currentValue;
        }

        return predictValue(currentValue, growthRate, years-1)*(1+growthRate);

    }

    public static void main(String[] args){
        double currentValue = 1000;
        double growthRate = 0.10;
        int years = 2;

        double futureValue = predictValue(currentValue, growthRate, years);

        System.out.println("Future Value:- " + futureValue);
    }
}
