public class testRESTAirtable {
	string authorizationHeader;
    string apiEndPoint = 'https://flashlight360.zendesk.com/api/v2';
    string apiKeyString = 'pat900DeBhYkdlzq3.9ba52cd58f67d40c06335da08c58430cc877e6f1b7208ff1d33e82342ae3cd1d';
    string airTableURI = 'https://api.airtable.com/v0';
    string airtableBaseKeyString = 'app0pNOF6LpuHjFYs';
        
    public testRESTAirtable()
    {
        Blob headerValue = Blob.valueOf(apiKeyString);
		authorizationHeader = 'Bearer ' + EncodingUtil.base64Encode(headerValue);
        
        Blob airtableBaseKeyBlob = Blob.valueOf(airtableBaseKeyString);

    }
    
    public string GetRows() {
        HttpRequest rq = new HttpRequest();
        rq.setEndpoint('https://api.airtable.com/v0/app0pNOF6LpuHjFYs/tble4pxwiPeep7Cdf?fields%5B%5D=Districts&fields%5B%5D=School');
        rq.setHeader('Authorization','Bearer ' + apiKeyString);
        rq.setHeader('Content-Type','application/json');
        rq.setHeader('Accept','application/json');
        

        rq.setMethod('GET');
        HttpResponse rsp = new Http().send(rq);
        
        system.debug(rsp.getbody());
        
        return rsp.getbody();
    }
    
    
    public void CreateTicket()
    {
        try {
            HttpRequest rq = new HttpRequest();
            rq.setHeader('Authorization', authorizationHeader);
            rq.setMethod('GET');
            
            rq.setEndpoint(apiEndPoint + '/users.json');
        
            HttpResponse rsp = new Http().send(rq);
    
            if(rsp.getStatusCode() == 200) { 
                ZendeskUser allusers = ZendeskUser.parse(rsp.getbody());
                string pretty = JSON.serializepretty(allusers);
                system.debug(pretty);
            } else {
                system.debug('callout failed with status code: ' + rsp.getstatuscode());
            }
        } 
        catch(Exception e)
        {
            system.debug(e);
        }
    }
   
}