// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
	$('.ajax_pagination a').live("click", function(){  
		$.get(this.href, null, null, 'script');     
		return false;     
	});
});
