# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
	$("#allReceipts").tablesorter()
	$("#receipt_date").datepicker()
	
	# calculate total text field value.  ignore data from optional argument indexRemoved
	updateTotal = (indexRemoved) ->
		indexRemoved = (if (typeof indexRemoved is "undefined") then -1 else indexRemoved)
		total = 0
		
		# go through each receipt item (by is_credit element)
		item_cost = $(".item_cost")
		index = 0

		while index < item_cost.length
			currentName = item_cost.eq(index).attr("name")
			
			# parse index of element name
			receipt_index = currentName.substring(34, currentName.length - 7)
			if $("[name='receipt[receipt_items_attributes][" + receipt_index + "][_destroy]']").val() is "false" and receipt_index isnt indexRemoved
				itemcost = $("[name='receipt[receipt_items_attributes][" + receipt_index + "][cost]']").val() * $("[name='receipt[receipt_items_attributes][" + receipt_index + "][quantity]']").val()
				total += itemcost
			index++
		$("#receipt_total").val total
		return

	receiptItemCount = $(".nested-fields").length
	unless receiptItemCount is 0
		$("#receipt_total").prop "readonly", true
		$("#receipt_total").addClass "input-disabled"
	$(document).on "click", "a[name = 'receiptItemAssociation']", (event) ->
		if event.target.id is "addReceiptItem"
			receiptItemCount++
			$("#receipt_total").prop "readonly", true
			$("#receipt_total").addClass "input-disabled"
		else
			receiptItemCount--
			itemFullName = $(this).prev().attr("name")
			updateTotal itemFullName.substring(34, itemFullName.length - 11)
			console.log receiptItemCount
			if receiptItemCount is 0
				$("#receipt_total").prop "readonly", false
				$("#receipt_total").removeClass "input-disabled"
		return
		
	$(document).on "keyup", ".item_cost", ->
		updateTotal()
		return
		
	$(document).on "change", ".item_quantity", ->
		updateTotal()
		return
		
	$(document).on "keyup", ".item_quantity", ->
		updateTotal()
		return