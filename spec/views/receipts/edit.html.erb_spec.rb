require 'spec_helper'

describe "receipts/edit" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt,
      :total => "9.99",
      :transaction_number => "MyString",
      :purchase_type => nil,
      :title => "MyString",
      :folder => nil,
      :note => "MyText",
      :vendor => nil,
      :currency => nil
    ))
  end

  it "renders the edit receipt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receipt_path(@receipt), "post" do
      assert_select "input#receipt_total[name=?]", "receipt[total]"
      assert_select "input#receipt_transaction_number[name=?]", "receipt[transaction_number]"
      assert_select "input#receipt_purchase_type[name=?]", "receipt[purchase_type]"
      assert_select "input#receipt_title[name=?]", "receipt[title]"
      assert_select "input#receipt_folder[name=?]", "receipt[folder]"
      assert_select "textarea#receipt_note[name=?]", "receipt[note]"
      assert_select "input#receipt_vendor[name=?]", "receipt[vendor]"
      assert_select "input#receipt_currency[name=?]", "receipt[currency]"
    end
  end
end
