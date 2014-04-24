$ ->
	#Click fires up a modal to register or log in
	#Usage: Add it to buttons that require log in when you don't want them to leave the page
	$('.needs-login').click (event) ->
		if (event.ctrlKey||event.metaKey)&&event.which==1
			return true
		else
			event.preventDefault();
			$("#loginModal").modal('show')
