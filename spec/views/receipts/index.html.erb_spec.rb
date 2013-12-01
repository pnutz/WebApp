require 'spec_helper'

describe "receipts/index" do
  before(:each) do
    assign(:receipts, [
      stub_model(Receipt,
        :total => "9.99",
        :transaction_number => "Transaction Number",
        :purchase_type => nil,
        :title => "Title",
        :folder => nil,
        :note => "MyText",
        :vendor => nil,
        :currency => nil
      ),
      stub_model(Receipt,
        :total => "9.99",
        :transaction_number => "Transaction Number",
        :purchase_type => nil,
        :title => "Title",
        :folder => nil,
        :note => "MyText",
        :vendor => nil,
        :currency => nil
      )
    ])
  end

  it "renders a list of receipts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
