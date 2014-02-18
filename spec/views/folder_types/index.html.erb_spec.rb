require 'spec_helper'

describe "folder_types/index" do
  before(:each) do
    assign(:folder_types, [
      stub_model(FolderType),
      stub_model(FolderType)
    ])
  end

  it "renders a list of folder_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
