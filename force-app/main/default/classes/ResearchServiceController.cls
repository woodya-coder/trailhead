public class ResearchServiceController {
    
    public static Integer processEquipmentsRequest() {
        String endpoint = 'callout:Research_Guardian/equipments'; 
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        
        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            System.debug('Available Equipments: ' + responseBody);
        } else {
            System.debug('Callout failed with status code: ' + response.getStatusCode());
        }
        return response.getStatusCode();
    }

}