trigger CalculateRequestTrigger on Calculation_Request__c (before insert)         //creating trigger class and adding event
{
if(trigger.isbefore && trigger.isInsert)                                          //adding context varible
    {
      CalculationRequestTriggerHandler.Calculation(trigger.new);                  /*calling handler class function & giving record 
                                                                                   list as input parameter*/ 
    }
}