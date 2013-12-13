require 'spec_helper'

describe User do
    context "In general" do
        it "must have an email and password" do
            user = User.new()
            user.should_not be_valid

        end
    end
end
