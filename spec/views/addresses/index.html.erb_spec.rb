require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :street_address => "MyText",
        :zipcode => "Zipcode",
        :references => ""
      ),
      stub_model(Address,
        :street_address => "MyText",
        :zipcode => "Zipcode",
        :references => ""
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
