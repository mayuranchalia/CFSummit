component  hint="This is persistence implementation to persist/retrieve category information from database" output="true"   {
		
		
	function saveCategory(categoryName,categoryDescription) returntype="CFSummit.Catalogue.model.category"   access="public"     {
		
		queryexecute("insert into category_table (category_name,category_description) values(?,?)",
			[categoryName,categoryDescription],{result="result"});
			
			category = createObject("component", "CFSummit.Catalogue.model.category" );
			category.category_name = categoryName;
			category.category_description = categoryDescription;
			category.category_id = result.generatedkey;			
			return category;
	}		
	
	function getCategoryDetailsById(categoryIdArg) returntype="CFSummit.Catalogue.model.category" access="public" {
		
		qparams = {brandid={value=categoryIdArg , cfsqltype ='cf_sql_integer'}};
		queryObj = queryexecute("select * from category_table where brand_id=:brandid",qparams);
		category = createObject("component", "CFSummit.Catalogue.model.category");
		category.category_description = queryObj["CATEGORY_DESCRIPTION"][1];
		category.category_name = queryObj["CATEGORY_NAME"][1];
		category.category_id = categoryIdArg;
			return category;
	}
		
	function getCategories() returntype="CFSummit.Catalogue.model.category[]" access="public" {
		queryResultObj = queryexecute("select * from category_table");
		var categoryList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			category = createObject("component", "CFSummit.Catalogue.model.category" );
			category.category_description = queryResultObj.category_description;
			category.category_name = queryResultObj.category_name;
			category.category_id  = queryResultObj.category_id;		
			arrayAppend(categoryList,category);
		}
		return categoryList;
	}     
}