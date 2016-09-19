component hint = "this is the persistence implementation to persist/retrieve promotion information from database"  {
	
	function addPromotion(promotionType,promotionDescription,promotionStatus,promotionRule) returntype="promotion"   access="public" description="Adds promotion details to the DB"    {
		
		queryexecute("insert into promotion_table (promotion_type,promotion_description,promotion_status,promotion_rule) values(?,?,?,?)",
			[promotionType,promotionDescription,promotionStatus,promotionRule],{result="result"});
		promotion = createObject("component", "promotion" );
		promotion.promotion_description = promotionDescription;
		promotion.promotion_type = promotionType;
		promotion.promotion_status = promotionStatus;
		promotion.promotion_rule = promotionRule;
		promotion.promotion_id = result.generatedkey;
		return promotion;	
			
		}
		
	function getPromotions() returntype="promotion[]" access="public" {
		queryResultObj = queryexecute("select * from promotion_table");
		var promotionList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			promotion = createObject("component", "promotion" );
			promotion.promotion_id = queryResultObj.promotion_id;
			promotion.promotion_type = queryResultObj.promotion_type;
			promotion.promotion_description = queryResultObj.promotion_description;
			promotion.promotion_status = queryResultObj.promotion_status;
			promotion.promotion_rule = queryResultObj.promotion_rule;
			promotion.promotion_discount_code = queryResultObj.promotion_discount_code;
			arrayAppend(promotionList,promotion);
		}
		return promotionList;
	}
		
	function generateDiscountCode(promotionIDArg) returntype="string" access="public"      {
			if(checkIfPromotionEntryExist(promotionIDArg)){
				UUID = createuuID();
				qparams = {promotionDiscountCode={value=UUID,cfsqltype ='cf_sql_varchar'},promotionId={value=promotionIDArg , cfsqltype ='cf_sql_integer'}};
				queryexecute("update  promotion_table set promotion_discount_code=:promotionDiscountCode where promotion_id=:promotionId",qparams);	
				return UUID;
			}else{
				return "error";
			}
	}
	
	function getDiscountCode(promotionIDArg)returntype="string" access="public"      {
		if(checkIfPromotionEntryExist(promotionIDArg)){
			qparams = {promotionId={value=promotionIDArg , cfsqltype ='cf_sql_integer'}};
			queryResultObj = queryexecute("select promotion_discount_code from promotion_table  where promotion_id=:promotionId",qparams);	
			return queryResultObj.promotion_discount_code;
		}else{
			return "Not Found";
		}
	}
	
	function invalidateDiscountCode(discountCodeArg,promotionStatusArg) returntype="boolean" access="public"     {
		if(checkIfDiscountCodeExist(discountCodeArg)){
			qparams = {promotionStatus={value=promotionStatusArg,cfsqltype ='cf_sql_varchar'},promotionDiscountCode={value=discountCodeArg,cfsqltype ='cf_sql_varchar'}};
			queryexecute("update  promotion_table set promotion_status=:promotionStatus where promotion_discount_code=:promotionDiscountCode",qparams);
			return true;
		}else{
			return false;
		}
	}
		
	
	function checkIfDiscountCodeExist(discontCodeArg) access= "private" returntype="boolean"   {
	    	
		    qparams = {discountCode={value=discontCodeArg , cfsqltype ='cf_sql_varchar'}};
			queryResultObj = queryexecute("select * from promotion_table where promotion_discount_code=:discountCode",qparams);
			return queryResultObj.RecordCount > 0;
	}  
	
	function checkIfPromotionEntryExist(promotionIDArg) access= "private" returntype="boolean"   {
	    	
		    qparams = {promotionid={value=promotionIDArg , cfsqltype ='cf_sql_integer'}};
			queryResultObj = queryexecute("select * from promotion_table where promotion_id=:promotionid",qparams);
			return queryResultObj.RecordCount > 0;
	}  
}