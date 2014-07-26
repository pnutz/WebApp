require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :is_snapshot => false,
      :receipt => nil
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_path(@document), "post" do
      assert_select "input#document_is_snapshot[name=?]", "document[is_snapshot]"
      assert_select "input#document_receipt[name=?]", "document[receipt]"
    end
  end
end
