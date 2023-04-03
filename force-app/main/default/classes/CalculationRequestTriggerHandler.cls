public class CalculationRequestTriggerHandler {                                     // creating handler class
   
    public static void Calculation (List <Calculation_Request__c> currentrecord ){         // creating function & passing list as parameter
      
     
        for(Calculation_Request__c newrec: currentrecord)                                       // iterating list using for each loop
        {
            
            
  List<Calculation_Request__c> existingrecordList =[SELECT Id, Calculated_Output__c, Operation_Type__c, Number_Two__c, Number_One__c FROM Calculation_Request__c ];
                                                                                     //creating list and saving existing record.
            
            decimal NumberOne=newrec.Number_One__c;            //defining variable and its value
            decimal NumberTwo=newrec.Number_Two__c;
            string  operation=newrec.Operation_Type__c;
           
            
            
   switch on operation {                                                          //using switch statment
       
                When 'Addition'
                {
                    for(Calculation_Request__c oldrec : existingrecordList)               //iterating existing record list using for each loop
                    {
                        if(oldrec.Number_One__c==NumberOne && oldrec.Number_Two__c==NumberTwo && oldrec.Operation_Type__c==operation)  {   /*comparing listrecord with 
                                                                                                                                          with old data*/                     
                          
                       newrec.adderror('Error!! Same Calculation is Availabel in Records');        // validation rule of trigger
                      }
                        newrec.Calculated_Output__c =CalculatorHelper.addition(numberOne, numberTwo);      //calling handler function
                     }
                }
       
       
                When 'Subtraction'
                {
                    for(Calculation_Request__c oldrec : existingrecordList)
                    {
                        if(oldrec.Number_One__c==NumberOne && oldrec.Number_Two__c==NumberTwo && oldrec.Operation_Type__c==operation)
                      {
                          newrec.adderror('Error!! Same Calculation is Availabel in Records');
                      }
            newrec.Calculated_Output__c =CalculatorHelper.subtraction(numberOne, numberTwo);
                    }
                }
       
       
       
                When 'Multiplication'
                {
                    for(Calculation_Request__c oldrec : existingrecordList)
                    {
                        if(oldrec.Number_One__c==NumberOne && oldrec.Number_Two__c==NumberTwo && oldrec.Operation_Type__c==operation)
                      {
                          newrec.adderror('Error!! Same Calculation is Availabel in Records');
                      }
            newrec.Calculated_Output__c =CalculatorHelper.multiplication(numberOne, numberTwo);
                    }
                }
       
       
       
                When 'Division'
                {
                    for(Calculation_Request__c oldrec : existingrecordList)
                    {
                        if(oldrec.Number_One__c==NumberOne && oldrec.Number_Two__c==NumberTwo && oldrec.Operation_Type__c==operation)
                    {
                        newrec.adderror('Error!! Same Calculation is Availabel in Records');
                      }
                        
             decimal result=CalculatorHelper.division(numberOne, numberTwo);
                        
                        if (result==-1)
                        {
                            newrec.adderror('Error!! Cannot Divide By Zero');
                        }
                        else
                        {
                            newrec.Calculated_Output__c=result;
                        }
                    }
                }
            }
        }
  
    }

}