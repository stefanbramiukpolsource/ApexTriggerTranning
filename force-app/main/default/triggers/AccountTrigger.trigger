trigger AccountTrigger on Account (before update) {
    Map<Id, Account> accountsById = Trigger.newMap;
    List<Contact> contacts = [
        SELECT MailingCity, AccountId
        FROM Contact
        WHERE AccountId IN :accountsById.keySet()
    ];

    for(Contact c : contacts){
        Account myAccount = accountsById.get(c.AccountId);
        c.MailingCity = myAccount.BillingCity;
    }
    update contacts;

}