require 'spec_helper'

describe "documents/show" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :is_snapshot => false,
      :receipt => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
