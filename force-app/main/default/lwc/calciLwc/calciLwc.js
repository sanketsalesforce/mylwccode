import { LightningElement , track } from 'lwc';

export default class CalciLwc extends LightningElement {

    @track object1 = {firstname:"", lastname:"" };

   handeln1(event){
    alert("n1111");
    const field = event.target.name;

    if(field === 'firstname'){
        this.object1.firstname= event.target.value;    
    }

    else if(field === 'lastname'){
        this.object1.lastname= event.target.value;  
    }
    
   }
}