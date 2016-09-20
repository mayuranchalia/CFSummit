component restpath="gateways" rest="true"{
	
	function listGateways() access="remote" httpmethod="GET" returntype="CFSummit.Gateway.model.gateway[]" 
	 				produces="application/json" description="List all the Payment Gateways"{
	 					
	 		getwayPersistence = createObject("component", "CFSummit.Gateway.persistence.gatewaypersistence" );	
			gateways = getwayPersistence.getgateWays();
			return gateways;
	}
	
	function enableGateway(required numeric gatewayId restargname="gatewayId" restargsource="Path")access="remote" httpmethod="PUT" 
	 						returntype="boolean" restpath="enable/{gatewayId}" description="Enable a Payment Gateway" {
		
			getwayPersistence = createObject("component", "CFSummit.Gateway.persistence.gatewaypersistence" );	
			status = getwayPersistence.editGatewayStatus(gatewayId,"active");
			return status;
	}
	
	function disableGateway(required numeric gatewayId restargname="gatewayId" restargsource="Path")access="remote" httpmethod="PUT"
							 returntype="boolean" restpath="disable/{gatewayId}" description="Disable a Payment Gateway"{
							 	
			getwayPersistence = createObject("component", "CFSummit.Gateway.persistence.gatewaypersistence" );	
			status = getwayPersistence.editGatewayStatus(gatewayId,"inactive");
			return status;
	 }
}