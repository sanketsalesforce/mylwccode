trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Opportunity> opplist = new List<Opportunity>();         

List<Task> tasklist= new List<Task>();                                

switch on Trigger.operationtype{
When After_Insert{
opplist=trigger.new;
}
When After_Update{
opplist=[SELECT Id, Name FROM Opportunity WHERE Id IN : Trigger.new AND StageName='Closed Won'];}
}
    
for(Opportunity op : opplist){

tasklist.add(new Task(Subject='Follow Up Test Task', WhatId=op.Id));
}
}