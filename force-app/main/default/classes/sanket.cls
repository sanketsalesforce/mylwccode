public class sanket {
    private static void addition (integer a, integer b){
        integer sum =a+b;
        system.debug('sum is' +sum);
    }
    private static void multiplication (integer x, integer y){
        integer multiply =x*y;
        system.debug(multiply);        
    }
    private static void subtraction (integer w, integer q){
        integer subtract = w-q;
        system.debug(subtract);  
}
    private static void division (integer w, integer q){
        integer divide = w/q;
        system.debug(divide);  
    }
    public void all (integer a, integer b){
        addition (a,b);
        multiplication (a,b);
        subtraction (a,b);
       division (a,b);
    }   
}