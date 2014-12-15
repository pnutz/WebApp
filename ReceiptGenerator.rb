Folder.delete_all
Receipt.delete_all
ReceiptItem.delete_all

# add receipts to users
User.all.each do |user|
  # add non sub folders
  5.times do
    Folder.create(:name => Faker::Name.name,
                  :folder_type_id => 5,
                  :folder_id => nil,
                  :description => "fdfas",
                  :profile_id => Profile.where(:user_id => user.id).sample.id,
                  :user_id => user.id)
  end
  5.times do
    parent_folder = Folder.where(:user_id => user.id, :folder_id => nil).sample
    Folder.create(:name => Faker::Name.name,
                  :folder_type_id => 5,
                  :folder_id => parent_folder.id,
                  :description => "sub folderrrrr",
                  :profile_id => parent_folder.profile_id,
                  :user_id => user.id)
  end

  15.times do
    receipt = Receipt.create()
    receipt.total = Faker::Number.decimal(4)
    receipt.subtotal = Faker::Number.decimal(4)
    receipt.transaction_number = Faker::Number.number(4)
    receipt.note = Faker::Lorem.sentence
    receipt.currency_id = Currency.all.sample.id
    folder = Folder.where(:user_id => user.id).sample
    receipt.folder_id = folder.id
    receipt.vendor_id = Vendor.all.sample.id
    receipt.category_id = ReceiptCategory.all.sample.id
    receipt.profile_id = folder.profile_id
    receipt.user_id = user.id
    receipt.date = rand(Date.parse('2012-01-01')..Date.parse('2012-12-01'))
    receipt.save()
  end

  80.times do
    item = ReceiptItem.create();
    item.receipt_id = Receipt.all.sample.id
    item.item_type_id = ItemType.all.sample.id
    item.cost = Faker::Number.decimal(4)
    item.quantity = Faker::Number.number(3)
    item.save()
  end

  45.times do
    tax = ReceiptTax.create();
    tax.receipt_id = Receipt.all.sample.id
    tax.tax_type_id = TaxType.all.sample.id
    tax.cost = Faker::Number.decimal(4)
    tax.save()
  end
end

puts "Finished seeding database with false data"
