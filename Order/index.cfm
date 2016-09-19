<cfscript>
	orderPersistence = createObject("component", "CFSummit.Order.persistence.orderpersistence");
	/*products = arraynew(1);
	productStruct = structnew();
	productStruct.product_id = 2;
	productStruct.product_merchant_id = 1;
	productStruct.quantity = 3 ;
	arrayAppend(products,productStruct);
	//writeOutput(serializeJSON(products));
	productString = serializeJSON(products);
	order = orderPersistence.createOrder(1,"cart",productString,"1");
	writeOutput(serializeJSON(order));*/
	
	order = orderPersistence.getOrders("FA290252-A1F3-8697-CDC9EDB372E746ED");
	writeOutput(serializeJSON(order));
/*	productString = serializeJSON(products);
	order = orderPersistence.updateOrder(1,1,1,"cart",productString);
	writeOutput(serializeJSON(order));*/
	//writeOutput(createuUID());
	
	response = orderPersistence.deleteOrder(3,"mayur");
	writeOutput(response);
</cfscript>