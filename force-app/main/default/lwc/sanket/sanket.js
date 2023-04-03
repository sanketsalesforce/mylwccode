import { LightningElement } from 'lwc';
export default class sanket extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}