// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require tinymce-jquery
//= require_tree .

$(document).ready(function() {
	if ($('.containers').length > 0){
		$( ".containers ul" ).sortable({
			beforeStop: function (event, ui) { 
				draggedItem = ui.item;
				draggedItemId = draggedItem.attr("id");
				parentId = $('#'+draggedItemId).parent().attr("id");
				var childrenIds = [];

				$('#'+parentId).children().each(function ()
				{
					if($(this).attr("id")!=null && $(this).attr("id")!=""){
				    	childrenIds.push($(this).attr("id"));
				    }
				});			
				$("#doing_op").html("Ordering...");
				$("#doing_op").show("fast");
				$.get("containers/order", { pId: parentId, sIds: childrenIds.join(',') } );
			}
		});
	}
});

function hideEl(id){
	setTimeout(function() {
	    $('#'+id).fadeOut('fast');
	}, 2000); // <-- time in milliseconds
}

