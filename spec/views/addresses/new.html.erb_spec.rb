require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :street_address => "MyText",
      :zipcode => "MyString",
      :city_id => 1
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "textarea#address_street_address[name=?]", "address[street_address]"
      assert_select "input#address_zipcode[name=?]", "address[zipcode]"
      assert_select "input#address_city_id[name=?]", "address[city_id]"
    end
  end
end
