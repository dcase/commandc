// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function set_current_category(category_id) {
	new Ajax.Request('/portfolio_menu_items/set_current', { 
		parameters : {
			id : category_id,
			authenticity_token : AUTH_TOKEN
			}
		});
}