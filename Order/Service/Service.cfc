component  rest="true" restpath="order" {
	
	function getOrders(required string customerId restargname="customerId" restargsource="Path") access="remote" produces="application/json" returntype="CFSummit.Order.model.order[]" httpmethod="GET" 
	 					restpath="{customerId}" description="API to retrieve the list order for a customer"{
		orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
		ordres = orderPersistence.getOrders(customerId);
		return ordres;
	}
	
	function deleteOrder(required string customerId restargname="customerId" restargsource="Path",
		required numeric orderId restargname="orderId" restargsource="Path" )access="remote" httpmethod="DELETE" 
	 					restpath="{customerId}/{orderId}" returntype="boolean" description="Delete the order"{			
	 		orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
			orderresponse = orderPersistence.deleteOrder(orderId,customerId);
			return 	orderresponse;			
	 						
	 }
	 
	 function placeOrder(required string customerId restargname="customerId" restargsource="Form",
	 	required string orderStatus restargname="orderStatus" restargsource="Form" ,
	 	required string orderProducts restargname="orderProducts" restargsource="Form",
	 	required numeric paymentGatewayId restargname="paymentGatewayId" restargsource="Form")access="remote" consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST" 
	  									 returntype="CFSummit.Order.model.order" description="API to place order"{
	  		orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
			order = orderPersistence.createOrder(customerId,orderStatus,orderProducts,paymentGatewayId);
			return order;
	 }
	 
	 function updateOrder(required string customerId restargsource="path" restargname="customerId",
	 required string orderId restargsource="Form" restargname="orderId",
	 required numeric paymentGatewayId restargsource="Form" restargname="paymentGatewayId",
	 required string orderStatus  restargsource="Form" restargname="orderStatus",
	 required string orderProducts restargsource="Form" restargname="orderProducts") access="remote" restpath="{customerId}" consumes="application/x-www-form-urlencoded" 
	  						returntype="boolean" httpmethod="PUT" description="Update an existing order"{
	 	orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
		orderResponse = orderPersistence.updateOrder(customerId,orderId,paymentGatewayId,orderStatus,orderProducts);
		return orderResponse;
	 }
}