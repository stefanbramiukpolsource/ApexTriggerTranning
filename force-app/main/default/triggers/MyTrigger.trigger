/**
 * Author:        John Doe
 * DO NOT EVER DO THAT :)
**/
trigger MyTrigger on Account (before update) {
    Account myAccount = Trigger.new[0];
    List<Contact> contacts = [SELECT MailingCity FROM Contact WHERE AccountId = :myAccount.Id];
    for(Contact c : contacts){
        c.MailingCity = myAccount.BillingCity;
    }
    update contacts;
}