module WebApp
  class Country < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true

    has_many :province_states 
  end
end
