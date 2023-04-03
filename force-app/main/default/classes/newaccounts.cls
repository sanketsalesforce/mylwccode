public class newaccounts {
    
    private static integer addition (integer a, integer b){
        return a + b;
      }
    
    private static integer multiplication (integer a, integer b){
        return a * b;
      }
    
    private static void calc (integer summ, integer multiplyy){
        system.debug(summ);
        system.debug(multiplyy);
      }
    
    public void domath(integer a, integer b){
    	integer sum = addition(a,b);
        integer multiply = multiplication(a,b);
        calc(sum,multiply);
        }
     
}