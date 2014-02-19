# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
	$("#foldertabs").tabs()
	
	treeDivs = $("div.treeViewDiv")
	treeLength = treeDivs.length
	index = 0
	while index < treeLength
		root_tree = $("#" + treeDivs.eq(index).attr('id'))

		root_tree.jstree
			plugins:
				['themes']
			themes:
				theme: 'default'
		index++
	
	# click function to open all nodes in tab
	$("li.foldertab").click ->
		divId = $(this).find("a")[0].getAttribute('href')
		root_tree = $(divId)
		root_tree.jstree "open_all"