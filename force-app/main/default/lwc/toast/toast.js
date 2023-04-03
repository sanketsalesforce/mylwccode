import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class Toast extends LightningElement {

FUNCTION1() {
This.FUNCTION2();
}


FUNCTION2() {

const event = new ShowToastEvent({
                  title: 'hi',
                  message : 'hi bhau',
                  varient : 'success',
                })
this.dispatchEvent(event);
    }}