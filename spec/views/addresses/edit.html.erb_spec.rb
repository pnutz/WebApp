require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :street_address => "MyText",
      :zipcode => "MyString",
      :references => ""
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", address_path(@address), "post" do
      assert_select "textarea#address_street_address[name=?]", "address[street_address]"
      assert_select "input#address_zipcode[name=?]", "address[zipcode]"
      assert_select "input#address_references[name=?]", "address[references]"
    end
  end
end
