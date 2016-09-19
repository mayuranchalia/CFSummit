<cfcomponent restpath="merchant" rest="true">
	
	<cffunction name="addProduct" access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" produces="application/json" 
					restpath="product/{merchantId}" returntype="boolean"  description="Add a new product">
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productPrice" restargname="productPrice" restargsource="Form" type="numeric" >
		<cfargument name="productQuantity" restargname="productQuantity" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.addProduct(merchantId,productId,productPrice,productQuantity);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="updateProductPrice"  access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" 
				restpath="product/price/{merchantId}" returntype="boolean" description="Update product pricing information" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productPrice" restargname="productPrice" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.updateProductPrice(merchantId,productId,productPrice);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="updateProductQuantity" access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" 
					restpath="product/quantity/{merchantId}" returntype="boolean" description="Update product quantity" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productQuantity" restargname="productQuantity" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.updateProductQuantity(merchantId,productId,productQuantity);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="deleteProduct" access="remote" httpmethod="DELETE" restpath="product/{merchantId}" returntype="boolean" 
	 					 description="Delete a product for the Merchant">
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Query " type="numeric" >
		<cfscript>
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.deleteProduct(merchantId,productId);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="getMerchantProducts" access="remote" httpmethod="GET" restpath="product/{merchantId}" returntype="array" 
	 						produces="application/json" description="Get products for the Merchant">
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfscript>
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.getMerchantProduct(merchantId);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
</cfcomponent>