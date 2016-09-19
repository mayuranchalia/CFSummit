component hint="This is persistence implementation to persist/retrieve product information from database" {
	
	
	function saveProduct(prdName,prdDescription,prdBrandId,prdCategoryId,prdImageLinks) returntype="CFSummit.Product.model.product" access="public" {
		
		queryexecute("insert into product_table (product_name,product_description,product_brand_id,product_category_id,product_image_links) values(?,?,?,?,?)",
			[prdName,prdDescription,prdBrandId,prdCategoryId,prdImageLinks],{result="result"});
		
		linkArray = prdImageLinks.split(",");
		product = createObject("component", "CFSummit.Product.model.product" );
		product.product_name = prdName;
		product.product_description = prdDescription;
		product.product_brand_id = prdBrandId;
		product.product_category_id = prdCategoryId;
		product.product_image_links = linkArray;
		product.product_id = result.generatedkey;
		
		return product;
	}
	
	function getProducts() returntype="CFSummit.Product.model.product[]" access="public" {
		queryResultObj = queryexecute("select * from product_table");
		var productList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			product = createObject("component", "CFSummit.Product.model.product" );
			product.product_name = queryResultObj.product_name;
			product.product_description = queryResultObj.product_description;
			product.product_brand_id = queryResultObj.product_brand_id;
			product.product_category_id = queryResultObj.product_category_id;
			image_links = queryResultObj.product_image_links;
			linkArray = image_links.split(",");
			product.product_image_links = linkArray;
			product.product_id = queryResultObj.product_id;
			colors = queryResultObj.product_color;
			if(!isnull(colors)){
				product.product_color = colors.split(",");
			}
			arrayAppend(productList,product);
		}
		return productList;
	} 
	
	function getProductsByBrand(brandIdArg) returntype="CFSummit.Product.model.product[]" access="public" {
		
		qparams = {brandid={value=brandIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from product_table where product_brand_id=:brandid",qparams);
		var productList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			product = createObject("component", "CFSummit.Product.model.product" );
			product.product_name = queryResultObj.product_name;
			product.product_description = queryResultObj.product_description;
			product.product_brand_id = queryResultObj.product_brand_id;
			product.product_category_id = queryResultObj.product_category_id;
			image_links = queryResultObj.product_image_links;
			linkArray = image_links.split(",");
			product.product_image_links = linkArray;
			product.product_id = queryResultObj.product_id;
			colors = queryResultObj.product_color;
			if(!isnull(colors)){
				product.product_color = colors.split(",");
			}
			arrayAppend(productList,product);
		}
		if(queryResultObj.recordcount < 1 ){
			throw("Product not found","404", "product with brand id "&brandIdArg&" not found.", "404");
		}
		return productList;
	}     
	
	function getProductsById(productIdArg) returntype="CFSummit.Product.model.product" access="public" {
		
		qparams = {productid={value=productIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from product_table where product_id=:productid",qparams);
			product = createObject("component", "CFSummit.Product.model.product" );
			product.product_name = queryResultObj.product_name;
			product.product_description = queryResultObj.product_description;
			product.product_brand_id = queryResultObj.product_brand_id;
			product.product_category_id = queryResultObj.product_category_id;
			image_links = queryResultObj.product_image_links;
			linkArray = image_links.split(",");
			product.product_image_links = linkArray;
			product.product_id = queryResultObj.product_id;
			colors = queryResultObj.product_color;
			if(!isnull(colors)){
				product.product_color = colors.split(",");
			}
		if(queryResultObj.recordcount < 1 ){
			throw("Product not found","404", "product with product id "&productIdArg&" not found.", "404");
		}
		return product;
	}  
	
	function getProductsByCategory(categoryIdArg) returntype="CFSummit.Product.model.product[]" access="public" {
		
		qparams = {categoryid={value=categoryIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from product_table where product_category_id=:categoryid",qparams);
		var productList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			product = createObject("component", "CFSummit.Product.model.product" );
			product.product_name = queryResultObj.product_name;
			product.product_description = queryResultObj.product_description;
			product.product_brand_id = queryResultObj.product_brand_id;
			product.product_category_id = queryResultObj.product_category_id;
			image_links = queryResultObj.product_image_links;
			linkArray = image_links.split(",");
			product.product_image_links = linkArray;
			product.product_id = queryResultObj.product_id;
			colors = queryResultObj.product_color;
			if(!isnull(colors)){
				product.product_color = colors.split(",");
			}
			arrayAppend(productList,product);
		}
		if(queryResultObj.recordcount < 1 ){
			throw("Product not found","404", "product with category id "&brandIdArg&" not found.", "404");
		}
		return productList;
	} 
	
	function updateProductDetails(productStruct) returntype="boolean"   access="public" {
			writeDump(productStruct);
			product_id = productStruct["product_id"];
			if(checkIfProductEntryExist(product_id)){
			product_name = productStruct["product_name"];
			imageArray = productStruct["product_image_links"];
			product_description = productStruct["product_descrition"];
			product_brand_id = productStruct["product_brand_id"];
			product_category_id = productStruct["product_category_id"];
			product_image_links = "";		
				for(i=1;i<=imageArray.size();i++){
						if(i==1){
							product_image_links = imageArray[i];
						}else{
							product_image_links = product_image_links & "," & imageArray[i];
						}
				}
				return true;
			}else{
				return false;
			}
		
		}	
	    
	function checkIfProductEntryExist(productIDArg) access= "private" returntype="boolean"   {
	    	
		    qparams = {productid={value=productIDArg , cfsqltype ='cf_sql_integer'}};
			queryResultObj = queryexecute("select * from product_table where product_id=:productid",qparams);
			if(queryResultObj.recordcount < 1 ){
				throw("Product not found","404", "product with id "&productIDArg&" not found.", "404");
			}
			return queryResultObj.RecordCount > 0;
	}  
}