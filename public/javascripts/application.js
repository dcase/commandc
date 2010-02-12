// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function set_current_category(category_id, redirect) {
	var options = { 
		parameters : {
			id : category_id,
			authenticity_token : AUTH_TOKEN
			}
		};
	if(typeof(redirect) != "undefined") {
		Object.extend(options, {
			onComplete: function() {
				window.location.href = redirect;
			}
		})
	}
	
	new Ajax.Request('/portfolio_menu_items/set_current', options);
}
Event.observe(window, "load", function() {
	if (Prototype.Browser.WebKit) {
		$(document.body).addClassName("is_webkit");
	}
	$("contact-submit").down("input").observe("click", function(event) {
		button = Event.element(event);
		button.replace($("working").innerHTML);
		return true;
	});
});