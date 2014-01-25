# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Online", "Physical"].each do |pt|
  PurchaseType.find_or_create_by_name(pt)
end

["Canada", "USA"].each do |country|
  Country.find_or_create_by_name(country)
end

canada = Country.find_by_name("Canada")
["BC", "AB"].each do |ps|
  canada.province_states.find_or_create_by_name(ps)
end

usa = Country.find_by_name("USA")
["WA"].each do |ps|
  usa.province_states.find_or_create_by_name(ps)
end

bc = ProvinceState.find_by_name("BC")
["Vancouver", "Burnaby", "Richmond", "Surrey", "North Vancouver"].each do |city|
  bc.cities.find_or_create_by_name(city)
end

ab = ProvinceState.find_by_name("AB")
["Calgary", "Edmonton"].each do |city|
  ab.cities.find_or_create_by_name(city)
end

wa = ProvinceState.find_by_name("WA")
["Seattle"].each do |city|
  wa.cities.find_or_create_by_name(city)
end

Currency.create(:code => "CAD", :description => "Canadian Dollars")
Currency.create(:code => "USD", :description => "US Dollars")

["Business", "Personal"].each do |ft|
  FolderType.find_or_create_by_name(ft)
end
