require 'spec_helper'

describe "receipts/show" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt,
      :total => "9.99",
      :transaction_number => "Transaction Number",
      :purchase_type => nil,
      :title => "Title",
      :folder => nil,
      :note => "MyText",
      :vendor => nil,
      :currency => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/Transaction Number/)
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
