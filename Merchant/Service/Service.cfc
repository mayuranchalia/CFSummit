component rest="true" restpath="merchant"   {
	
	function addProduct(required numeric merchantId  restargname="merchantId" restargsource="Path",
		required numeric productId restargname="productId" restargsource="Form",
		required numeric productPrice restargname="productPrice" restargsource="Form",
		required numeric productQuantity restargname="productQuantity" restargsource="Form") 
		access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" produces="application/json" 
						restpath="product/{merchantId}" returntype="boolean"  description="Add a new product"	{
		
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.addProduct(merchantId,productId,productPrice,productQuantity);
			return response;
		}
	
	function updateProductPrice(required numeric merchantId  restargname="merchantId" restargsource="Path",
		required numeric productId restargname="productId" restargsource="Form",
		required numeric productPrice restargname="productPrice" restargsource="Form") access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" 
				restpath="product/price/{merchantId}" returntype="boolean" description="Update product pricing information"{
			
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.updateProductPrice(merchantId,productId,productPrice);
			return response;
	}
	
	function updateProductQuantity(required numeric merchantId  restargname="merchantId" restargsource="Path",
		required numeric productId restargname="productId" restargsource="Form",
		required numeric productQuantity restargname="productQuantity" restargsource="Form" )  access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" 
					restpath="product/quantity/{merchantId}" returntype="boolean" description="Update product quantity"{
		merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
		response = merchantPersistence.updateProductQuantity(merchantId,productId,productQuantity);
		return response;
	}
	
	function deleteProduct(required numeric merchantId  restargname="merchantId" restargsource="Path",
	required numeric productId restargname="productId" restargsource="Query") access="remote" httpmethod="DELETE" restpath="product/{merchantId}" returntype="boolean" 
	 					 description="Delete a product for the Merchant"{
		merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
		response = merchantPersistence.deleteProduct(merchantId,productId);
		return response;
	}
	
	function getMerchantProducts(required numeric merchantId restargname="merchantId" restargsource="Path")access="remote" httpmethod="GET" 
			restpath="product/{merchantId}" returntype="array" produces="application/json" description="Get products for the Merchant"{
			merchantPersistence = createObject("component", "CFSummit.Merchant.persistence.merchantpersistence" );	
			response = merchantPersistence.getMerchantProduct(merchantId);
			return response;
	}
}