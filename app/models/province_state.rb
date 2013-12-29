class ProvinceState < ActiveRecord::Base
  belongs_to :countries

  has_many :cities
end
