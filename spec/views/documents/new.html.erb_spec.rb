require 'spec_helper'

describe "documents/new" do
  before(:each) do
    assign(:document, stub_model(Document,
      :is_snapshot => false,
      :receipt => nil
    ).as_new_record)
  end

  it "renders new document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", documents_path, "post" do
      assert_select "input#document_is_snapshot[name=?]", "document[is_snapshot]"
      assert_select "input#document_receipt[name=?]", "document[receipt]"
    end
  end
end
