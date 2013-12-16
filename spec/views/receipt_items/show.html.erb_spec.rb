require 'spec_helper'

describe "receipt_items/show" do
  before(:each) do
    @receipt_item = assign(:receipt_item, stub_model(ReceiptItem,
      :receipt => nil,
      :item_type => nil,
      :cost => "9.99",
      :quantity => 1,
      :is_credit => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
