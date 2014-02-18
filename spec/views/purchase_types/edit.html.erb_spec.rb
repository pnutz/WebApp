require 'spec_helper'

describe "purchase_types/edit" do
  before(:each) do
    @purchase_type = assign(:purchase_type, stub_model(PurchaseType))
  end

  it "renders the edit purchase_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", purchase_type_path(@purchase_type), "post" do
    end
  end
end
