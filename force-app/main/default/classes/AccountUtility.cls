public class AccountUtility {
 public static void viewAnnualRevenue(){   
     list <Account> accountsList = [select Name, AnnualRevenue from Account];
     System.debug(accountsList);
     for (account acc : accountsList)
     {
         String acctRev = acc.Name + ' : ' + acc.AnnualRevenue;
         System.debug(acctRev);
	  }
}
}