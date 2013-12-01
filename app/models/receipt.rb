class Receipt < ActiveRecord::Base
  belongs_to :purchase_type
  belongs_to :folder
  belongs_to :vendor
  belongs_to :currency
end
