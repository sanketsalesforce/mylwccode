import { LightningElement, track, wire } from 'lwc';
import calculator from'@salesforce/apex/wire123.calculator';

const columns = [
{label: 'name' , fieldname: 'Name'},
{label: 'accountinfo', fieldname: 'ID'},
]

export default class Wire extends LightningElement {

    @track columns = columns;

   @track data = [];

  @wire (calculator)
   xyz({data,error}){
 
    if (data){
    this.data=data;
 }
 else if (error){

    console.log("erorrrr");
 }


   }

  }