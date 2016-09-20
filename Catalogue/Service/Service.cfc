component rest="true" restpath="products"   {
	
	function addProduct(required string productName restargsource="form" restargname="productName",
		required string productDescription restargsource="form" restargname="productDescription",
		required numeric productBrandId restargsource="form" restargname="productBrandId",
		required numeric productCategoryId restargsource="form" restargname="productCategoryId",
		required string productImageLinks restargsource="form" restargname="productImageLinks") access="remote" consumes="application/x-www-form-urlencoded"
		httpmethod="POST" produces="application/json" returntype="cfsummit.catalogue.model.product"  description="Add a new product"   {
			
			productPersistence = createObject("component", "cfsummit.catalogue.persistence.productpersistence" );
			product = productPersistence.saveProduct(productName,productDescription,productBrandId,productCategoryId,productImageLinks);
			return product;
	}
	
	function getProducts() access="remote" produces="application/json" httpmethod="GET" 
					returntype="cfsummit.catalogue.model.product[]" description="Get list of products"{
			productPersistence = createObject("component", "cfsummit.catalogue.persistence.productpersistence" );
			products = productPersistence.getProducts();
			return products;
		
	}     

	function getProductById(required numeric productId restargsource="Path" restargname="productId") access="remote" restpath="{productId}"  
			produces="application/json" returntype="cfsummit.catalogue.model.product"  description="Retrieve product details by product id"  {
			
			productModel = createObject("component", "cfsummit.catalogue.model.product" );
			productModel.product_id = productId;
			return productModel;
	}
	
	function searchProducts(required numeric searchId restargsource="query " restargname="searchId")  access="remote" httpmethod="GET" produces="application/json" restpath="search" 
	 				returntype="cfsummit.catalogue.model.product[]" description="Search list of products by brand id" {
		productPersistence = createObject("component", "cfsummit.catalogue.persistence.productpersistence" );
		products = productPersistence.getProductsByBrand(searchId);
		return products;
		
	}
	
	function getBrands() access="remote" httpmethod="GET" restpath="brand" returntype="cfsummit.catalogue.model.brand[]" 
				produces="application/json"  description="Get all the brands"{
			brandPersistence = createObject("component", "cfsummit.catalogue.persistence.brandpersistence" );
			brands = brandPersistence.getBrands();
			return brands;
	}
	
	function getCategories() access="remote" httpmethod="GET" restpath="category" returntype="cfsummit.catalogue.model.category[]" 
	 						produces="application/json" description="Get list of product categories" {
	 		categorypersistence = createObject("component", "cfsummit.catalogue.persistence.categorypersistence" );
			categories = categorypersistence.getCategories();
			return categories;
	 }
	 
	 function addBrand(required string brandName restargsource="Form" restargname="brandName",
	 	required string brandDescription restargsource="Form" restargname="brandDescription") access="remote" httpmethod="POST" produces="application/json" 
	 	consumes="application/x-www-form-urlencoded"  restpath="brand" returntype="cfsummit.catalogue.model.brand" description="Add a new brand"{
	     	brandPersistence = createObject("component", "cfsummit.catalogue.persistence.brandpersistence" );
			brand = brandPersistence.saveBrand(brandName,brandDescription);                               	
	        return brand ;                         	
	  }
	  
	  function addCategory(required string categoryName restargname="categoryName" restargsource="Form",
	  	required string categoryDescription restargname="categoryDescription" restargsource="Form")access="remote" httpmethod="POST" restpath="category" returntype="cfsummit.catalogue.model.category" 
	  					produces="application/json" consumes="application/x-www-form-urlencoded" description="Add a new product category"{
	  	categorypersistence = createObject("component", "cfsummit.catalogue.persistence.categorypersistence" );
		category = categorypersistence.saveCategory(categoryName,categoryDescription);
		return category;
	  }
}