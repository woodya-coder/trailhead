trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity where Id in :trigger.new];
    List<Task> tasksToCreate = new List<Task>();
    
    for(Opportunity opp : opps) {
        if(opp.StageName == 'Closed Won') {
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.whatId = opp.Id;
            tasksToCreate.add(t);
        }
    }
    insert tasksToCreate;
}