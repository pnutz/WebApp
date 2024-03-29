# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Books", "Video", "Clothes",
 "Electronics", "Office Supplies",
 "Sporting Goods"].each do |item_type|
   newType = ItemType.create(:name => item_type);
   newType.save();
end

["Sales Tax", "Shipping & Handling"].each do |tax_type|
   newType = TaxType.create(:name => tax_type);
   newType.save();
end

["Amazon", "Wal-Mart", "NCIX", "TigerDirect", "eBay",
 "NewEgg", "London Drugs", "Best Buy", "FutureShop"].each do |vendor|
    newVendor = Vendor.create(:name => vendor);
    newVendor.save();
end

# sort by currency code
all_countries = Country.all
valid_countries = []

all_countries.each do |country|
  valid_countries << country if Country[country[1]].currency != nil
end

valid_countries = valid_countries.sort_by { |country| Country[country[1]].currency['code'] }
valid_countries.each do |country|
  Currency.find_or_create_by(:code => Country[country[1]].currency['code'],
                            :description => Country[country[1]].currency['name'],
                            :symbol => Country[country[1]].currency['symbol'])
end

["Appliances", "Automotive", "Baby", "Clothing & Accessories", "Electronics",
  "Entertainment", "Furniture", "Grocery", "Health & Beauty", "Home & Pets",
  "Jewellery & Watches", "Movies, Music, & Books", "Office & Stationery",
  "Outdoor Living", "Sports & Recreation", "Toys", "Video Games"].each do |receipt_category|
  category = ReceiptCategory.create(:category => receipt_category);
  category.save()
end

puts "Finished seeding database"