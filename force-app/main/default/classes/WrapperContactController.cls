public with sharing class WrapperContactController {

    @AuraEnabled(Cacheable=true)          
    
    public static List<ContactWrapper> searchContacts(String textKey) {            //creating class

        textKey = '%'+ textKey +'%';                                               //creating variable
        
        List<ContactWrapper> wrapprConList = new List<ContactWrapper>();           //creating empty wrapperlist
        
        List<Contact> conList = [SELECT Name, Email, MobilePhone,Account.BillingCity, Account.BillingState FROM Contact
                                 WHERE Name LIKE: textKey
                                  OR  Email LIKE: textKey
                                  OR MobilePhone LIKE: textKey
                                  OR  Account.BillingCity LIKE: textKey
                                  OR  Account.BillingState LIKE: textKey
                                  LIMIT 10];

        for(Contact con :conList ) {                        //using foreach loop to iterate conlist

            ContactWrapper newWrp = new ContactWrapper();   //creating object
            newWrp.Id = con.Id;                             //passing values to wrapper class object
            newWrp.Name = con.Name;
            newWrp.Email = con.Email;
            newWrp.MobilePhone = con.MobilePhone;
            newWrp.BillingCity = con.Account.BillingCity;
            newWrp.BillingState = con.Account.BillingState; 
           
            wrapprConList.add(newWrp);                 //adding object inside wrapper empty list
        }
        return wrapprConList;                          //returning list
    }
    
    public class ContactWrapper {                    //creating wrapper class
        @AuraEnabled 
        public Id Id { get; set; }                   //creating variables inside wrapper class
         
        @AuraEnabled 
        public String Name { get; set; }
        @AuraEnabled 
        public String Email { get; set; }
        @AuraEnabled 
        public String MobilePhone {get; set;}
        @AuraEnabled 
        public String BillingCity { get; set; }
        @AuraEnabled 
        public String BillingState { get; set; }
}
}