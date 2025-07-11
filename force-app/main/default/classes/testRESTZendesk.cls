public class testRESTZendesk {
	string authorizationHeader;
    string apiEndPoint = 'https://flashlight360.zendesk.com/api/v2';
    
    public testRESTZendesk()
    {
        Blob headerValue = Blob.valueOf('woody@flashlight360.com/token:XV7oejgaSpVMdNxoFQCpt8Vd2iFdUO29SiFsWjjG');
		authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
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