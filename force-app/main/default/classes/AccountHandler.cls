public class AccountHandler { //created class
    
    PUBLIC static void insertAccount(integer noofaccounts) { //created method
        
        integer n=1; //defining variable 
            
       list <account> addaccounts = new list<account> () ; //created list
        
       do {
            account sanket = new account();
            sanket.Name = 'Acme Inc ' + n;
            sanket.AccountNumber = 'A000' +n;
            
            n=n+1;
           addaccounts.add(sanket);
            Insert addaccounts;
       }
          while( n<=noofaccounts );        
    }
    
}