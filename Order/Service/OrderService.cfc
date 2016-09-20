<!---<cfcomponent rest="true" restpath="order">
	<cffunction name="getOrders" access="remote" produces="application/json" returntype="CFSummit.Order.model.order[]" httpmethod="GET" restpath="{customerId}" description="API to retrieve the list order for a customer">
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="string" >
			<cfscript>
				orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
				ordres = orderPersistence.getOrders(customerId);
			</cfscript>
			<cfreturn ordres>
	</cffunction>
	
	<cffunction name="deleteOrder" access="remote" httpmethod="DELETE" restpath="{customerId}/{orderId}" returntype="boolean" description="Delete the order">
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="string" >
		<cfargument name="orderId" restargname="orderId" restargsource="Path" type="numeric" >
		<cfscript>
			orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
			orderresponse = orderPersistence.deleteOrder(orderId,customerId);
		</cfscript>
		<cfreturn orderresponse>
	</cffunction>
	
	<cffunction name="placeOrder" access="remote" consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST"  returntype="CFSummit.Order.model.order" description="API to place order">
		<cfargument name="customerId" restargname="customerId" restargsource="Form" type="string" >
		<cfargument name="orderStatus" restargname="orderStatus" restargsource="Form" type="string" >
		<cfargument name="orderProducts" restargname="orderProducts" restargsource="Form" type="string" >
		<cfargument name="paymentGatewayId" restargname="paymentGatewayId" restargsource="Form" type="numeric" >
		<cfscript>
			orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
			order = orderPersistence.createOrder(customerId,orderStatus,orderProducts,paymentGatewayId);
		</cfscript>
		<cfreturn order>
	</cffunction>
	
	<cffunction name="updateOrder" access="remote" restpath="{customerId}" consumes="application/x-www-form-urlencoded" returntype="boolean" httpmethod="PUT" description="Update an existing order" >
		<cfargument name="customerId" restargsource="path" restargname="customerId" type="string" >
		<cfargument name="orderId" restargsource="Form" restargname="orderId" type="string" >
		<cfargument name="paymentGatewayId" restargsource="Form" restargname="paymentGatewayId" type="numeric" >
		<cfargument name="orderStatus" restargsource="Form" restargname="orderStatus" type="string" >
		<cfargument name="orderProducts" restargsource="Form" restargname="orderProducts" type="string" >
		<cfscript>
			orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
			orderResponse = orderPersistence.updateOrder(customerId,orderId,paymentGatewayId,orderStatus,orderProducts);
		</cfscript>
		<cfreturn orderResponse>
	</cffunction>
</cfcomponent>--->