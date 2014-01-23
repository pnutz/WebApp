class Currency < ActiveRecord::Base
	def currency_desc
		code + ' - ' + description
	end
end