require 'spec_helper'

describe "purchase_types/new" do
  before(:each) do
    assign(:purchase_type, stub_model(PurchaseType).as_new_record)
  end

  it "renders new purchase_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", purchase_types_path, "post" do
    end
  end
end
