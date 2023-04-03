public class CalculatorHelper {
   
    public static decimal addition(decimal numberOne, decimal numberTwo){         //creating static method addition to perform addition of two numbers
        return numberOne + numberTwo;
    }

    public static decimal subtraction(decimal numberOne, decimal numberTwo){       //creating static method subtraction to perform subtraction of two numbers    
        return  numberOne - numberTwo;
    }

    public static decimal multiplication(decimal numberOne, decimal numberTwo){    //creating static method multiplication to multiply two numbers 
        return  numberOne * numberTwo;
    }

    public static Decimal division(decimal numberOne, decimal numberTwo){          //creating static method division to divide two numbers
       decimal x=0;
        decimal y;
        try{                                                                       //using try-catch method to catch exception and showing error
            y= numberOne/numberTwo;                        
        }
        catch (Exception e)   //checking error                
        {
           
            x=-1;           //defining 'x' value = -1
        }
        if(x==-1)            //
        {
            return -1;
        }
        else
        {
           return y;
        }
     
       
    }
}