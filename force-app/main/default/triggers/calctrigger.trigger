trigger calctrigger on trgcalculator__c (after insert, after update, after delete, after undelete,
                                         before insert,before update,before delete) {
                                             
if (trigger.Isinsert && trigger.Isafter){
     calctriggerhelper.addition (trigger.new);
}
                                             
else if (trigger.Isupdate && trigger.Isafter) {
         calctriggerhelper.subtraction ();
}
                                             
else if (trigger.Isdelete && trigger.Isafter){
        calctriggerhelper.multiplication ();
}

else if (trigger.Isundelete && trigger.Isafter){
         calctriggerhelper.division();
}
}