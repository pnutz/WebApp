require 'spec_helper'

describe "purchase_types/index" do
  before(:each) do
    assign(:purchase_types, [
      stub_model(PurchaseType),
      stub_model(PurchaseType)
    ])
  end

  it "renders a list of purchase_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
