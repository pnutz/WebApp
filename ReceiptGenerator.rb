Folder.delete_all
Receipt.delete_all
Vendor.delete_all
ItemType.delete_all

["Books", "Video", "Clothes", 
 "Electronics", "Office Supplies", 
 "Sporting Goods"].each do |item_type|
   newType = ItemType.create(:name => item_type);
   newType.save();
end

["Amazon", "Wal-Mart", "NCIX", "TigerDirect", "eBay", 
 "NewEgg", "London Drugs", "Best Buy", "FutureShop"].each do |vendor|
    newVendor = Vendor.create(:name => vendor);
    newVendor.save();
end

["CAD", "USD", "RMB", "EUR"].each do |money|
  currency = Currency.create(:code => money);
  currency.save();
end

["Auto", "Food", "Entertainment", "Sports"].each do |purchase_type|
  purchase = PurchaseType.create(:name => purchase_type);
  purchase.save()
end


# add receipts to users
User.all.each do |user|
  # add non sub folders
  5.times do
    Folder.create(:name => Faker::Name.name, 
                  :folder_type_id => 5,
                  :folder_id => nil,
                  :description => "fdfas",
                  :user_id => user.id)
  end
  5.times do
    Folder.create(:name => Faker::Name.name, 
                  :folder_type_id => 5,
                  :folder_id => Folder.where(:user_id => user.id, :folder_id => nil).sample.id,
                  :description => "sub folderrrrr",
                  :user_id => user.id)
  end

  50.times do
    receipt = Receipt.create()
    receipt.total = Faker::Number.decimal(4)
    receipt.title = Faker::Lorem.sentence
    receipt.transaction_number = Faker::Number.number(4)
    receipt.note = Faker::Lorem.sentence
    receipt.currency_id = Currency.all.sample.id
    receipt.folder_id = Folder.all.sample.id
    receipt.vendor_id = Vendor.all.sample.id
    receipt.purchase_type_id = PurchaseType.all.sample.id
    receipt.user_id = user.id
    receipt.date = rand(Date.parse('2012-01-01')..Date.parse('2012-12-01'))
    receipt.save()
  end

  300.times do
    item = ReceiptItem.create();
    item.receipt_id = Receipt.all.sample.id
    item.item_type_id = ItemType.all.sample.id
    item.cost = Faker::Number.decimal(4)
    item.quantity = Faker::Number.number(3)
    item.is_credit = false
    item.save()
  end
end
