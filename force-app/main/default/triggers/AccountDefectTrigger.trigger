/**
 * Author:        Jane Doe
 * DO NOT EVER DO THAT :)
**/
trigger AccountDefectTrigger on Account (before update) {

    for(Account a : Trigger.new){
        List<Contact> contacts = [
            SELECT MailingCity
            FROM Contact
            WHERE AccountId = :a.Id
        ];
        for(Contact c : contacts){
            c.MailingCity = a.BillingCity;
        }
        update contacts;
    }

}