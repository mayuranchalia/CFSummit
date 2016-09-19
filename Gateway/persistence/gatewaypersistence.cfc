component  hint="This is persistance implementation to persist/retrieve payment gateway information from database" {
	
	
	function getgateWays() returntype="CFSummit.Gateway.model.gateway[]" access="public"     {
		queryResultObj = queryexecute("select * from gateway_table");
		var gatewayList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			gateway = createObject("component", "CFSummit.Gateway.model.gateway" );
			gateway.gateway_id = queryResultObj.gateway_id;
			gateway.gateway_name = queryResultObj.gateway_name;
			gateway.gateway_description = queryResultObj.gateway_description;
			gateway.gateway_settings = queryResultObj.gateway_settings;
			gateway.gateway_status = queryResultObj.gateway_status;
			arrayAppend(gatewayList,gateway);
		}
		return gatewayList;
	}
	
	function editGatewayStatus(gatewayIdArg, gatewayStatusArg) returntype="boolean" access="public" {
		qparams = {gatewayId={value=gatewayIdArg , cfsqltype ='cf_sql_integer'},gatewayStatus={value=gatewayStatusArg,cfsqltype ='cf_sql_varchar'}};
		queryexecute("update  gateway_table set gateway_status=:gatewayStatus where gateway_id=:gatewayId",qparams);	
		return true;
	} 
		   
}