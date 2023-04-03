trigger AccountAddressTrigger on Account (before insert, before update) {

    if( (trigger.isbefore && trigger.isinsert) || (trigger.isbefore && trigger.isupdate) ) {    
    for (Account a : trigger.new){
        
        if (a.Match_Billing_Address__c == true ){
            
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
       
}
}