component  hint="This is persistence implementation to persist/retrieve brand information from database"
{
	function saveBrand(brandName,brandDescription) returntype="cfsummit.catalogue.model.brand" access="public"     {
		
		queryexecute("insert into brand_table (brand_name,brand_description) values(?,?)",
			[brandName,brandDescription],{result="result"});
			
			brand = createObject("component", "cfsummit.catalogue.model.brand");
			brand.brand_name = brandName;
			brand.brand_description = brandDescription;
			brand.brand_id = result.generatedkey;
			
			return brand;
	}
	function getBrands() returntype="cfsummit.catalogue.model.brand[]" access="public"      {
		queryResultObj = queryexecute("select * from brand_table");
		var brandList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			brand = createObject("component", "cfsummit.catalogue.model.brand" );
			brand.brand_name = queryResultObj.brand_name;
			brand.brand_description = queryResultObj.brand_description;
			brand.brand_id = queryResultObj.brand_id;		
			arrayAppend(brandList,brand);
		}
		return brandList;
	}
	function getBrandDetailsById(brandIdArg) returntype="cfsummit.catalogue.model.brand" access="public" {
		
		qparams = {brandid={value=brandIdArg , cfsqltype ='cf_sql_integer'}};
		queryObj = queryexecute("select * from brand_table where brand_id=:brandid",qparams);
		brand = createObject("component", "cfsummit.catalogue.model.brand");
		brand.brand_description = queryObj["BRAND_DESCRIPTION"][1];
		brand.brand_name = queryObj["BRAND_NAME"][1];
		brand.brand_id = brandIdArg;
			return brand;
		}
		
	function updateBrandDescription(brandIdArg, brandDescriptionArg) returntype="boolean" access="public" {
		qparams = {brandId={value=brandIdArg , cfsqltype ='cf_sql_integer'},brandDescription={value=brandDescriptionArg,cfsqltype ='cf_sql_varchar'}};
		queryexecute("update  brand_table set brand_description=:brandDescription where brand_id=:brandId",qparams);	
		return true;
	}  
	  	
	function updateBrandName(brandIdArg, brandNameArg) returntype="boolean" access="public" {
		qparams = {brandId={value=brandIdArg , cfsqltype ='cf_sql_integer'},brandName={value=brandNameArg,cfsqltype ='cf_sql_varchar'}};
		queryexecute("update  brand_table set brand_name=:brandName where brand_id=:brandId",qparams);	
		return true;
	}   
	
	function deleteBrandbyId(brandIdArg) returntype="boolean" access="public" {
		qparams = {brandId={value=brandIdArg , cfsqltype ='cf_sql_integer'}};
		queryexecute("delete from brand_table  where brand_id=:brandId",qparams);	
		return true;
	}    	
}