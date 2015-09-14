require 'rails_helper'

describe User do

  before do
    @user = User.new(email:                 "email@domain.com",
                     password:              "password",
                     password_confirmation: "password")
  end

  it "Should be valid User model" do
    expect(@user).to be_valid
  end

  describe "When email and password is not present" do
    before { @user.email =    "  ",
             @user.password = "  " }
    it { should_not be_valid }
  end

end
