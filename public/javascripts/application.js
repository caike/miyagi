// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).observe('dom:loaded', function(){ 
	Event.addBehavior({ 
		'#dojo_instructions': function(){
			this.innerHTML = "Are you ready ?"
		},		
		
     	
	});	
});