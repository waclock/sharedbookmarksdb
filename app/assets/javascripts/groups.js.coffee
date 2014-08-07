# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	if window.users
		$(".typeahead#search_user").typeahead({                               
				source: window.users,
				updater: (item) ->
					add_user_to_group(item)
					return ''
		})

add_user_to_group = (email) ->
	$.ajax({
			url: "/add_user_to_group", 
			type: 'POST', 
			data: {email: email,group_id: window.group_id}, 
			success: (data) ->
				$('#users-table').append('<tr><td></td><td>'+email+'</td><td></td></tr>');					
				window.users.remove(email)				
		})


Array::remove = ->
  what = undefined
  a = arguments
  L = a.length
  ax = undefined
  while L and @length
    what = a[--L]
    @splice ax, 1  while (ax = @indexOf(what)) isnt -1
  this		