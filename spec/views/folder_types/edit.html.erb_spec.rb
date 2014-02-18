require 'spec_helper'

describe "folder_types/edit" do
  before(:each) do
    @folder_type = assign(:folder_type, stub_model(FolderType))
  end

  it "renders the edit folder_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", folder_type_path(@folder_type), "post" do
    end
  end
end
