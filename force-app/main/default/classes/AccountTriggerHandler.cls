public class AccountTriggerHandler {

    private AccountAddressSyncService accSyncService;

    public void onBeforeInsert(Map<Id, Account> newMap){
        
    }

    public void ofBeforeUpdate(Map<Id, Account> oldMap, Map<Id, Account> newMap){
        accSyncService.syncAddresses(oldMap, newMap);
    }


}
