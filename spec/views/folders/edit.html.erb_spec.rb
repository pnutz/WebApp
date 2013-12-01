require 'spec_helper'

describe "folders/edit" do
  before(:each) do
    @folder = assign(:folder, stub_model(Folder,
      :name => "MyString",
      :description => "MyText",
      :user => nil,
      :folder_type => nil,
      :folder => nil
    ))
  end

  it "renders the edit folder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", folder_path(@folder), "post" do
      assert_select "input#folder_name[name=?]", "folder[name]"
      assert_select "textarea#folder_description[name=?]", "folder[description]"
      assert_select "input#folder_user[name=?]", "folder[user]"
      assert_select "input#folder_folder_type[name=?]", "folder[folder_type]"
      assert_select "input#folder_folder[name=?]", "folder[folder]"
    end
  end
end
