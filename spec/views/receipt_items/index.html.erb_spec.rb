require 'spec_helper'

describe "receipt_items/index" do
  before(:each) do
    assign(:receipt_items, [
      stub_model(ReceiptItem,
        :receipt => nil,
        :item_type => nil,
        :cost => "9.99",
        :quantity => 1,
        :is_credit => false
      ),
      stub_model(ReceiptItem,
        :receipt => nil,
        :item_type => nil,
        :cost => "9.99",
        :quantity => 1,
        :is_credit => false
      )
    ])
  end

  it "renders a list of receipt_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
