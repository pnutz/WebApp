module HomeHelper
	def cascade(root)
		html = ''
		if root
			html = "<li class='folder' id='folder-#{root.id}'>#{root.name}"
			if (root.folders.length > 0 || root.receipts.length > 0)
				html << "<ul>"
				
				root.folders.each do |folder|
					html << cascade(folder)
				end
				
				root.receipts.each do |receipt|
					html << "<li class='receipt' id='receipt-#{receipt.id}' data-jstree='{\"icon\":\"assets/receipt_icon.png\"}'>#{receipt.title} - #{receipt.date.strftime("%m/%d/%Y")}</li>"
				end
				
				html << "</ul>"
			end
			html << "</li>"
		end
		return html
	end

	def recursive_tree(root)
		cascade(root).html_safe
	end
end