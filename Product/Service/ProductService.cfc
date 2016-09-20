<!---<cfcomponent restpath="products" rest="true" >
	
	<cffunction name="addProduct" access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" 
													produces="application/json" returntype="CFSummit.Product.model.product"  description="Add a new product">
		<cfargument name="productName" type="string" restargsource="Form" restargname="productName">
		<cfargument name="productDescription" type="string" restargsource="Form" restargname="productDescription">
		<cfargument name="productBrandId" type="numeric" restargsource="Form" restargname="productBrandId">
		<cfargument name="productCategoryId" type="numeric" restargsource="Form" restargname="productCategoryId">
		<cfargument name="productImageLinks" type="string" restargsource="Form" restargname="productImageLinks">
		<cfscript>
			productPersistence = createObject("component", "CFSummit.Product.persistence.productpersistence" );
			product = productPersistence.saveProduct(productName,productDescription,productBrandId,productCategoryId,productImageLinks);
		</cfscript>
		<cfreturn product>
	</cffunction>
	
	<cffunction name="getProducts" access="remote" httpmethod="GET" produces="application/json" returntype="CFSummit.Product.model.product[]" description="Get list of products" >
		<cfscript>
			productPersistence = createObject("component", "CFSummit.Product.persistence.productpersistence" );
			products = productPersistence.getProducts();
		</cfscript>
		<cfreturn products>
	</cffunction>
	
	<cffunction name="getProductById"  access="remote" restpath="{productId}" returntype="CFSummit.Product.model.product" description="Retrieve product details by product id" >
		<cfargument name="productId"  restargsource="path " restargname="productId" type="numeric" >
		<cfscript>
			productModel = createObject("component", "CFSummit.Product.model.product" );
			productModel.product_id = productId;
		</cfscript>
		<cfreturn productModel>
	</cffunction>
	
	<cffunction name="searchProducts"  access="remote" httpmethod="GET" produces="application/json" restpath="search" returntype="CFSummit.Product.model.product[]" description="Search list of products by brand id" >
		<cfargument name="searchId"  restargsource="query " restargname="searchId" type="numeric" >
		<cfscript>
			productPersistence = createObject("component", "CFSummit.Product.persistence.productpersistence" );
			products = productPersistence.getProductsByBrand(searchId);
		</cfscript>
		<cfreturn products>
	</cffunction>
	
	<cffunction name="addBrand" access="remote" httpmethod="POST" produces="application/json" consumes="application/x-www-form-urlencoded" 
	                                    restpath="brand" returntype="CFSummit.Product.model.brand" description="Add a new brand" >
		<cfargument name="brandName" restargsource="Form" restargname="brandName" type="string" >
		<cfargument name="brandDescription" restargsource="Form" restargname="brandDescription" type="string" >
		<cfscript>
			brandPersistence = createObject("component", "CFSummit.Product.persistence.brandpersistence" );
			brand = brandPersistence.saveBrand(brandName,brandDescription);
		</cfscript>
		<cfreturn brand>
	</cffunction>

	<cffunction name="getBrands" access="remote" httpmethod="GET" restpath="brand" returntype="CFSummit.Product.model.brand[]" produces="application/json"  description="Get all the brands">
		<cfscript>
			brandPersistence = createObject("component", "CFSummit.Product.persistence.brandpersistence" );
			brands = brandPersistence.getBrands();
		</cfscript>
		<cfreturn brands>
	</cffunction>	
	
	<cffunction name="getCategories" access="remote" httpmethod="GET" restpath="category" returntype="CFSummit.Product.model.category[]" produces="application/json" description="Get list of product categories" >
		<cfscript>
			categorypersistence = createObject("component", "CFSummit.Product.persistence.categorypersistence" );
			categories = categorypersistence.getCategories();
		</cfscript>
		<cfreturn categories>
	</cffunction>
	
	<cffunction name="addCategory" access="remote" httpmethod="POST" restpath="category" returntype="CFSummit.Product.model.category" produces="application/json" consumes="application/x-www-form-urlencoded" description="Add a new product category">
		<cfargument name="categoryName" restargname="categoryName"  type="string" restargsource="Form" >
		<cfargument name="categoryDescription" restargname="categoryDescription"  type="string" restargsource="Form" >
		<cfscript>
			categorypersistence = createObject("component", "CFSummit.Product.persistence.categorypersistence" );
			category = categorypersistence.saveCategory(categoryName,categoryDescription);
		</cfscript>
		<cfreturn category>
	</cffunction>
	
</cfcomponent>--->