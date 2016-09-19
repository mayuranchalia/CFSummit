component  displayname="Promotions" hint="This cfc contains properties of a promotion"{
	
	property name="promotion_id" type="numeric" displayname="Promotion Identifier" hint="Unique ID of Promotion. ";

	property name="promotion_type" type="string" displayname="Promotion Type" hint="Type of promotion, like free_ship ,buy_x_get_y_free ,discount_by_fixed etc";

	property name="promotion_description" type="string" displayname="Promotion Description" hint="Promotion Description.";
	
	property name="promotion_status" type="string" displayname="Promotion Status" hint="Whether the promotion is active or not.";
	
	property name ="promotion_rule" type = "string" displayname="Promotion rule" hint="The type of match rule either product_item, or product_brand.";
	
	property name ="promotion_discount_code" type = "string" displayname="Promotion Discount Code" hint="Discount code for this promotion.";
	
}