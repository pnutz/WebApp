require 'spec_helper'

describe "folder_types/show" do
  before(:each) do
    @folder_type = assign(:folder_type, stub_model(FolderType))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
