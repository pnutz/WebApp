require 'spec_helper'

describe "receipt_items/new" do
  before(:each) do
    assign(:receipt_item, stub_model(ReceiptItem,
      :receipt => nil,
      :item_type => nil,
      :cost => "9.99",
      :quantity => 1,
      :is_credit => false
    ).as_new_record)
  end

  it "renders new receipt_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receipt_items_path, "post" do
      assert_select "input#receipt_item_receipt[name=?]", "receipt_item[receipt]"
      assert_select "input#receipt_item_item_type[name=?]", "receipt_item[item_type]"
      assert_select "input#receipt_item_cost[name=?]", "receipt_item[cost]"
      assert_select "input#receipt_item_quantity[name=?]", "receipt_item[quantity]"
      assert_select "input#receipt_item_is_credit[name=?]", "receipt_item[is_credit]"
    end
  end
end
