@isTest 

public class Test_CalculatorFeature{

 @isTest                                                          //creating test method
    static void additionTest(){
        
        CalculatorVFCtrl.numberOne= 10;                           //passing dummy values
        CalculatorVFCtrl.numberTwo= 5;
        CalculatorVFCtrl.addition();                              //calling controller function
        system.assertEquals('15',CalculatorVFCtrl.result);        //using asser statment to cross check output
      

        
        CalculatorVFCtrl.numberOne= 10;                           //again passing dummy values to check duplication
        CalculatorVFCtrl.numberTwo= 5;
        CalculatorVFCtrl.addition();                              //calling controller function
        system.assertEquals('15.00',CalculatorVFCtrl.result);
       
    } 
   
    @isTest
    
    static void subtractionTest()
    {
    	CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
       // CalculatorVFCtrl.operation='Subtraction';
        CalculatorVFCtrl.subtraction();
        system.assertEquals('-3',CalculatorVFCtrl.result);     
        
      	CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
        //CalculatorVFCtrl.operation='Subtraction';
        CalculatorVFCtrl.subtraction();
        system.assertEquals('-3.00',CalculatorVFCtrl.result);
    }
   
    @IsTest
    static void DivisionTest()
    {
    CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
        //CalculatorVFCtrl.operation='Division';
        CalculatorVFCtrl.Division();
        system.assertEquals('0.5',CalculatorVFCtrl.result);      
   
        
    CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
        //CalculatorVFCtrl.operation='Division';
        CalculatorVFCtrl.Division();
        system.assertEquals('0.50',CalculatorVFCtrl.result);      
   
    }
    
     @isTest
    static void Divide_By_0_Division_Test()
    {
    CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 0;
        //CalculatorVFCtrl.operation='Division';
        CalculatorVFCtrl.Division();
        system.assertEquals('Error cannot divide by 0',CalculatorVFCtrl.result);      
    }
   
    @isTest
    static void MultiplicationTest()
    {
    	CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
        //CalculatorVFCtrl.operation='Multiplication';
        CalculatorVFCtrl.Multiplication();
        system.assertEquals('18',CalculatorVFCtrl.result);  
        //Database.SaveResult ds=
        
        CalculatorVFCtrl.numberOne= 3;
        CalculatorVFCtrl.numberTwo= 6;
        //CalculatorVFCtrl.operation='Multiplication';
        CalculatorVFCtrl.Multiplication();
        system.assertEquals('18.00',CalculatorVFCtrl.result);  
        //Database.SaveResult ds=
    }
   
    @isTest
    static void Reset_Test()
    {
        CalculatorVFCtrl.numberOne= 0;
        CalculatorVFCtrl.numberTwo= 0;
        CalculatorVFCtrl.Result= '0';
       
        CalculatorVFCtrl.Reset();
        system.assertEquals('0',CalculatorVFCtrl.result);      
        system.assertEquals(0,CalculatorVFCtrl.numberOne);      
        system.assertEquals(0,CalculatorVFCtrl.numberTwo);              
    }
    
}