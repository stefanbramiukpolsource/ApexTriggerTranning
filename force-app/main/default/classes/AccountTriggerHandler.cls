public class AccountTriggerHandler {

    private Boolean bypassTrigger = false;

    private AccountAddressSyncService accSyncService;

    public void onBeforeInsert(Map<Id, Account> newMap){
        if(!bypassTrigger){

        }
    }

    public void ofBeforeUpdate(Map<Id, Account> oldMap, Map<Id, Account> newMap){
        if(!bypassTrigger){
            accSyncService.syncAddresses(oldMap, newMap);
        }
    }

    public void shouldByPassTrigger(Boolean shouldByPassTrigger){
        bypassTrigger = shouldByPassTrigger;
    }

}
