component  hint="This is persistence implementation to persist/retrieve merchant product information from database" {
	
	function addProduct(merchantId,productId,productPrice,productQuantity) returntype="boolean" access="public"     {
		try{
			queryexecute("insert into merchant_product_table (merchant_id,product_id,product_price,product_quantity) values(?,?,?,?)",
			[merchantId,productId,productPrice,productQuantity],{result="result"});
		}catch (any exception){
			throw("Product already exist","409", "product with id "&productId&" already exist.", "409");
		}
		
		return true;
	}
	
	function updateProductPrice(merchantIdArg,productIdArg,productPriceArg)returntype="boolean" access="public" {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'},
						productPrice={value=productPriceArg,cfsqltype ='cf_sql_double'}};
		queryexecute("update  merchant_product_table set product_price=:productPrice where product_id=:productId AND merchant_id=:merchantId",qparams);	
		return true;
	}
	
	function updateProductQuantity(merchantIdArg,productIdArg,productQuantityArg) returntype="boolean" access="public" {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'},
						productQuantity={value=productQuantityArg,cfsqltype ='cf_sql_integer'}};
		queryexecute("update  merchant_product_table set product_quantity=:productQuantity where product_id=:productId AND merchant_id=:merchantId",qparams);	
		return true;
	}
	
	function deleteProduct(merchantIdArg,productIdArg) access="public"   returntype="boolean"  {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'}};
		queryexecute("delete from merchant_product_table  where merchant_id=:merchantId AND product_id=:productId",qparams);
		return true;	
	}
	
	function getMerchantProduct(merchantIdArg) access="public" returntype="Array"   {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'}};
		queryObj = queryexecute("select * from merchant_product_table where merchant_id=:merchantId",qparams);
		
		var merchantProductList = arraynew(1);
		cfloop(query="queryObj")
		{	
			merchantProdcut = structnew();
			merchantProdcut.merchant_id = queryObj.merchant_id;
			merchantProdcut.product_id = queryObj.product_id;
			merchantProdcut.prodcut_quantity = queryObj.product_quantity;
			merchantProdcut.product_price = queryObj.product_price;
			arrayAppend(merchantProductList,merchantProdcut);
		}
		return merchantProductList;
	}    	
}