require 'spec_helper'

describe "purchase_types/show" do
  before(:each) do
    @purchase_type = assign(:purchase_type, stub_model(PurchaseType))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
