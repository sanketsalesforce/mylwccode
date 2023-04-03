import { LightningElement, wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';                  
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import searchContacts from '@salesforce/apex/WrapperContactController.searchContacts';




const actions = [                                        //creating action constant
    { label: 'View', name: 'view' },
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
];
const COLUMNS = [                                            //creating column constant for data table
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Mobile', fieldName: 'MobilePhone', type: 'phone' },
    { label: 'Billing City', fieldName: 'BillingCity', type: 'text' },
    { label: 'Billing State', fieldName: 'BillingState', type: 'text' },
    {  type: 'action', typeAttributes: { rowActions: actions }, }
];





export default class ContactTable extends NavigationMixin(LightningElement) {      //js default class

    columns = COLUMNS;
    contactList;
    searchKey;
    
    
     
    handleInputChange(event) {                                        // this function will get value from text input
        let searchKeys = event.target.value;
        this.searchKey = searchKeys;
        
    }

    
    
    
    @wire(searchContacts, {textKey : '$searchKey'}) contactList;  //using wire decorator and passing parameter 
    
    
    
    handleContactCreate() {                                       //This function will create a new contact
        this[NavigationMixin.Navigate]({                          //using navigationmixin functionality to call new contact webpage of salesforce
            type: 'standard__objectPage',
            attributes:{
                objectApiName: 'Contact',
                actionName: 'new'
            }           
        });
}

    //This function will return view, edit, delete the record based what will select in action
    
    callRowAction(event) {

        const actionName = event.detail.action.name;    //creating variable and passing action name
        const row = event.detail.row;                   //creating variable and passsing row details
        this.recordId = row.Id;                         //creating variable and passsing row id
        
        
        switch (actionName) {                                     
            case 'view':
                this[NavigationMixin.Navigate]({                  //using navigationmixin functionality to call view webpage of salesforce
                    type: 'standard__recordPage',
                    attributes: {
                              recordId: row.Id,
                              actionName: 'view'
                    }
                });
                break;

            case 'edit':
                this[NavigationMixin.Navigate]({                  //using navigationmixin functionality to call edit webpage of salesforce
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        objectApiName: 'Contact',
                        actionName: 'edit'
                    }
                    
                });
                
                break;

                case 'delete':                     
                    this.delContact();                          //calling delete function
                    
                    break;    
        }
    }

   
    delContact(){                           //This function created for deleting the record

 
   deleteRecord(this.recordId)                    //Invoke the deleteRecord functionality to delete a record
    
   .then(() => {
 
        this.dispatchEvent(                       // We are firing a toast event for success
                      new ShowToastEvent({
                                         title: 'Success',
                                         message: 'Record is successfully deleted',
                                         variant: 'success'})
                                         );
                                         return refreshApex(this.contactList);
        })
    .catch((error) => {
    console.log(error);
    
    this.dispatchEvent(
                        new ShowToastEvent({                     // We are firing a toast event for error
                         title: 'Sorry',
                         message: 'Cannot delete this record since it is associated with a case',
                         variant: 'error'
      })
    
                     );
                 });
            }
        }