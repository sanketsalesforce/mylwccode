public class calctriggerhelper {
    
    public static decimal addition(list <trgcalculator__c> sanlist){
        decimal xy=0; 
        
        for (trgcalculator__c variableqw : sanlist){
            
            if (variableqw.value_one__c == variableqw.value_two__c ){
                variableqw.addError('your given values are same please enter different values');          
       }
            else{
                xy = (variableqw.value_one__c + variableqw.value_two__c);
            }
    }   
        system.debug (xy);
        return xy;
        
    }
        
    
    public static void subtraction(){
         system.debug('this is after delete record');
    }
     public static void multiplication(){
        system.debug('this is after delete record');
    }
    
     public static void division(){
      system.debug('this is after undelete record');  
    }
}