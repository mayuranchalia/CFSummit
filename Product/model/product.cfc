component  displayname="Product" hint="This is a product model"
{
	property name="product_id" type="numeric"   displayname="productId" hint="Unique identifier for the product";

	property name="product_name" type="string" displayname="product name" hint="Name of the product";

	property name="product_description" type="string" displayname="Product Description" hint="Description of product";

	property name="product_brand_id" type="numeric" displayname="Product brand identifier" hint="Product Brand";

	property name="product_category_id" type="numeric"   displayname="Product Category identifier" hint="Prodect Category";

	property name="product_image_links" type="array" displayname="Product Images" hint="Link to product images";
	
	property name ="product_color" type = "array" displayname ="Product Colors" hint="Various colors of the product";
	
	/**
		This is a example of subresource locator
	**/
	function getProduct() httpmethod="GET"  returntype ="cfsummit.product.model.product" access="remote" produces="application/json" {
		productPersistence = createObject("component", "cfsummit.product.persistence.productpersistence");
		product = productPersistence.getProductsById(this.product_id);
		return product;
	}	 
	
}