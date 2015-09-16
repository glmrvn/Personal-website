require 'rails_helper'

describe WelcomeController do

  it "Should be have redirect to create new user" do
    visit root_path
    expect(page).to have_content("Create admin user")
  end

end
