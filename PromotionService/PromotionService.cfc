<cfcomponent wsversion="2" >
	
	<cffunction name="addPromotion" access="remote" returntype="struct" >
		<cfargument name="promotionType" type="string" >
		<cfargument name="promotionDescription" type="string" >
		<cfargument name="promotionStatus" type="string" >
		<cfargument name="promotionRule" type="string" >
		<cfscript>
			promotionPersitence = createObject("component","promotionpersistence");
			promotion = promotionPersitence.addPromotion(promotionType,promotionDescription,promotionStatus,promotionRule);
			promotionStruct = structnew();
			promotionStruct.promotion_id = promotion.promotion_id;
			promotionStruct.promotion_type = promotion.promotion_type;
			promotionStruct.promotion_description = promotion.promotion_description;
			promotionStruct.promotion_status = promotion.promotion_status;
			promotionStruct.promotion_rule = promotion.promotion_rule;
		</cfscript>
		<cfreturn promotionStruct>
	</cffunction>
	
	<cffunction name="getPromotion"  access="remote" returntype="string" >
		<cfscript>
			promotionPersitence = createObject("component","promotionpersistence");
			promotions =  promotionPersitence.getPromotions();
			promotionsJson = serializeJSON(promotions);
		</cfscript>
		<cfreturn promotionsJson >
	</cffunction>
	
	<cffunction name="generateDiscountCode" access="remote" returntype="string" >
		<cfargument name="promotionIDArg"  type="numeric" >
		<cfscript>
			promotionPersitence = createObject("component","promotionpersistence");
			discountCode = promotionPersitence.generateDiscountCode(promotionIDArg);
		</cfscript>
		<cfreturn discountCode >
	</cffunction>
	
	<cffunction name="getDiscountCode" access="remote" returntype="string" >
		<cfargument name="promotionIDArg"  type="numeric" >
		<cfscript>
			promotionPersitence = createObject("component","promotionpersistence");
			discountCode = promotionPersitence.getDiscountCode(promotionIDArg);
		</cfscript>
		<cfreturn discountCode>
	</cffunction>
<!--- Invalidate discount code is pending--->
</cfcomponent>