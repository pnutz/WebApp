require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "testemail@email.com",
        :encrypted_password => "TESTPASS",
        :created_at => Time.new(1111,11,11,11,11,11),
      ),
      stub_model(User,
        :email => "testemail2@email.com",
        :encrypted_password => "TESTPASS2",
        :created_at => Time.new(1111,11,11,11,11,11),
      )
    ])
  end

  it "renders a list of user emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "testemail@email.com".to_s, :count => 1
    assert_select "tr>td", :text => "testemail2@email.com".to_s, :count => 1
  end
end
