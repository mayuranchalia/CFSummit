component  rest="true" restpath="order" {
	
	function getOrders(required string customerId restargname="customerId" restargsource="Path",
	 string accessTokenHeader restargsource="Header" restargname="X-Authorization" default="skipAuthz") access="remote" produces="application/json" returntype="cfsummit.order.model.order[]" httpmethod="GET" restpath="{customerId}" description="API to retrieve the list order for a customer"{
		validateCustomerIdUsingAccessToken(customerId, accessTokenHeader);
		orderPersistence = createObject("component", "cfsummit.order.persistence.orderpersistence");
		orders = orderPersistence.getOrders(customerId);
		return orders;
	}
	
	function deleteOrder(required string customerId restargname="customerId" restargsource="Path",
		required numeric orderId restargname="orderId" restargsource="Path",
	 string accessTokenHeader restargsource="Header" restargname="X-Authorization" default="skipAuthz") access="remote" httpmethod="DELETE" restpath="{customerId}/{orderId}" returntype="boolean" description="Delete the order"{	
			validateCustomerIdUsingAccessToken(customerId, accessTokenHeader);		
	 		orderPersistence = createObject("component", "cfsummit.order.persistence.orderpersistence");
			orderresponse = orderPersistence.deleteOrder(orderId,customerId);
			return 	orderresponse;			
	 						
	 }
	 
	 function placeOrder(required string customerId restargname="customerId" restargsource="Form",
	 	required string orderStatus restargname="orderStatus" restargsource="Form" ,
	 	required string orderProducts restargname="orderProducts" restargsource="Form",
	 	required numeric paymentGatewayId restargname="paymentGatewayId" restargsource="Form",
	 string accessTokenHeader restargsource="Header" restargname="X-Authorization" default="skipAuthz")access="remote" consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST" returntype="cfsummit.order.model.order" description="API to place order"{

			validateCustomerIdUsingAccessToken(customerId, accessTokenHeader);
	  		orderPersistence = createObject("component", "cfsummit.order.persistence.orderpersistence");
			order = orderPersistence.createOrder(customerId,orderStatus,orderProducts,paymentGatewayId);
			return order;
	 }
	 
	 function updateOrder(required string customerId restargsource="path" restargname="customerId",
	 required string orderId restargsource="Form" restargname="orderId",
	 required numeric paymentGatewayId restargsource="Form" restargname="paymentGatewayId",
	 required string orderStatus  restargsource="Form" restargname="orderStatus",
	 required string orderProducts restargsource="Form" restargname="orderProducts",
	 string accessTokenHeader restargsource="Header" restargname="X-Authorization" default="skipAuthz") access="remote" restpath="{customerId}" consumes="application/x-www-form-urlencoded" 
	  						returntype="boolean" httpmethod="PUT" description="Update an existing order"{
		validateCustomerIdUsingAccessToken(customerId, accessTokenHeader);
	 	orderPersistence = createObject("component", "cfsummit.order.persistence.orderpersistence");
		orderResponse = orderPersistence.updateOrder(customerId,orderId,paymentGatewayId,orderStatus,orderProducts);
		return orderResponse;
	 }
	
	 private function validateCustomerIdUsingAccessToken(string customerId, string accessTokenHeader) returntype = "void"{
	 	if(accessTokenHeader neq "skipAuthz") {  //just for the demo purpose adding this check skipAuth ideally this should not be present.
	 		// In upcoming updates API's does not need to get the token info for validating user (authorization purpose) & the same validation will happen on API Manager.
			//cflog(file = "oauth2.log", text = "Access Token Header is #accessTokenHeader#", type = "fatal"); 
			var accessToken = Trim(replace(accessTokenHeader, "Bearer ",""));
			apiManagerTokenInfoURL = "http://localhost:9100/oauth2/tokeninfo"; // remove hardcoding
			cfhttp (url = apiManagerTokenInfoURL, result = "result"){
				cfhttpparam(type = "header", name = "Authorization", value = accessTokenHeader);
			};
			//cflog(file = "oauth2.log", text = "File Content is #result.fileContent#", type = "fatal"); 
			if(result.statusCode == "200 OK") {
				tokenInfo = deserializeJSON(result.fileContent);
				userName = tokenInfo.userInfo.userName;
				if(userName eq customerId) return;
			}
			cfthrow (errorCode = "401", detail = "Backend - UnAuthorized Request.", type = "Application");		
		}
	 }
}
