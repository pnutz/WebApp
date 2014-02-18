require 'spec_helper'

describe "folder_types/new" do
  before(:each) do
    assign(:folder_type, stub_model(FolderType).as_new_record)
  end

  it "renders new folder_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", folder_types_path, "post" do
    end
  end
end
