public class CalculatorVFCtrl {                          //created public class
    
public static decimal numberOne {get;set;}              //defining varible and using get,set function 
public static decimal numberTwo {get;set;}              //defining varible and using get,set function
public static string result {get;set;}                  //defining varible and using get,set function
public static string operation {get;set;}               //defining varible and using get,set function
       
   
   
    public static void addition() {                 //creating static method addition
    
        operation='Addition';                           //defining operation
        Integer count=0;                                //creating variable and setting value
        Decimal result1;
        
 List<Calculation_Request__c> existingrecordlist =[SELECT Id, Calculated_Output__c, Operation_Type__c, Number_Two__c, Number_One__c FROM Calculation_Request__c];   /*creating list and adding data 
                                                                                                                                                                    to list from  Calculation_Request object*/           
        
    for(Calculation_Request__c recinstance : existingrecordlist )        //iterating list using for each loop
    {
     
        if(recinstance.Number_One__c==NumberOne && recinstance.Number_Two__c==NumberTwo && recinstance.Operation_Type__c==operation )       /*using if-else statment to check record 
                                                                                                                      is allready present in object or not*/
        {
               result1 = recinstance.Calculated_Output__c;               //saving output from object into result1 (decimal) variable    
               result=String.valueOf(result1);                          //converting output into string
               count=1;
               
             break;                                         //using break statment to stop the code
          }
     }
        
          if(count==0)
        {
            result1=CalculatorHelper.addition(numberOne, numberTwo);       //if result is not found in existing data calling helper class addition function
            result=String.valueOf(result1);                                //converting result1 into string
            save(numberOne, numberTwo,result1, operation);                 //calling save function which saves this created record in salesforce object
     }
     }
   
    
        public static void subtraction()        //creating static method subtraction
    {
        operation='Subtraction';
        Integer count=0;
        Decimal result1;
        List<Calculation_Request__c> existingrecordlist =[SELECT Id, Calculated_Output__c, Operation_Type__c, Number_Two__c, Number_One__c FROM Calculation_Request__c];
        
        for(Calculation_Request__c recinstance : existingrecordlist )
    {
            
        if(recinstance.Number_One__c==NumberOne && recinstance.Number_Two__c==NumberTwo && recinstance.Operation_Type__c==Operation )
    {
               result1 = recinstance.Calculated_Output__c;
               result=String.valueOf(result1);
               count++;
               break;
            }
        }
        if(count==0)
        {
            result1=CalculatorHelper.subtraction(numberOne, numberTwo);
            result=String.valueOf(result1);
            save(numberOne, numberTwo,result1, operation);
        }
    }

    
    
    
    
    public static void multiplication()              //creating static method multiplication
    {
        operation='Multiplication';
        Integer count=0;
        Decimal result1;
        
        List<Calculation_Request__c> existingrecordlist =[SELECT Id, Calculated_Output__c, Operation_Type__c, Number_Two__c, Number_One__c FROM Calculation_Request__c];
        
        for(Calculation_Request__c recinstance : existingrecordlist )
        {
            if(recinstance.Number_One__c==NumberOne && recinstance.Number_Two__c==NumberTwo && recinstance.Operation_Type__c==Operation )
            {
               result1 = recinstance.Calculated_Output__c;
               result=String.valueOf(result1);
               count++;
               break;
            }
        }
        if(count==0)
        {
             result1=CalculatorHelper.multiplication(numberOne, numberTwo);
             result=String.valueOf(result1);
             save(numberOne, numberTwo,result1, operation);
        }
    }
 
    
    public static void division()                     //creating static method division
    {
         operation='division';
         Integer count=0;
        Decimal result1;
        List<Calculation_Request__c> existingrecordlist =[SELECT Id, Calculated_Output__c, Operation_Type__c, Number_Two__c, Number_One__c FROM Calculation_Request__c];
        
        for(Calculation_Request__c recinstance : existingrecordlist )
        {
            if(recinstance.Number_One__c==NumberOne && recinstance.Number_Two__c==NumberTwo && recinstance.Operation_Type__c==Operation )
            {
               result1 = recinstance.Calculated_Output__c;
               result=String.valueOf(result1);
               count++;
               break;
            }
        }
        if(count==0)
        {
            result1=CalculatorHelper.division(numberOne, numberTwo);               //calling helper function
            if
                (result1==-1)
            {
                result='Error cannot divide by 0';           //adding error in output field
            }
            else
            {
                result = String.valueOf(result1);                //
                save(numberOne, numberTwo,result1, operation);
            }
        }
    }
   
   
    public static void reset(){               //created function 
        numberOne = 0;                        //defining values
        numberTwo = 0;
         result = '0';
       
    }
   
    public static void save(decimal numberOne,decimal  numberTwo,decimal result,string operation){      //creating static method save 
        
        List<Calculation_Request__c> calList = new List<Calculation_Request__c>();           //creating list to save new created record
       
        Calculation_Request__c cal = new Calculation_Request__c();                           //creating instance of Calculation_Request__c object
        
        cal.Number_One__c =numberOne;                                                     //adding field values in instance
        cal.Number_Two__c =numberTwo;
        cal.Operation_Type__c=operation;
        cal.Calculated_Output__c=result;
        
              calList.add(cal);                      //adding instance data into list  
       
               insert calList;                      //inserting list data into salesforce object
    }
}