if Vendor.all.size < 50
  50.times do
    Vendor.create(:name => Faker::Name.name)
  end
end

# add non sub folders
if Folder.all.size < 7 
  50.times do
    Vendor.create(:name => Faker::Name.name)
  end
end

# add receipts to users
User.all.each do |user|
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
end
