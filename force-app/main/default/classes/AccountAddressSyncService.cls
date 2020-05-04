public with sharing class AccountAddressSyncService {


    public void syncAddresses(Map<Id, Account> oldMap, Map<Id, Account> newMap){
        Map<Id, Account> filteredAccounts = filterAccounts(oldMap, newMap);
        syncContactAddressWithAccount(newMap);
    }

    private Map<Id, Account> filterAccounts(Map<Id, Account> oldMap, Map<Id, Account> newMap){
        return newMap;
    }

    private void syncContactAddressWithAccount(Map<Id, Account> newMap){
        Map<Id, Account> accountsById = newMap;
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

}
