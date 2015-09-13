require 'rails_helper'

describe Article do

  before do
    @article = Article .create(title: "Title here",
                              text: "Text here",
                              image_file_name: "file_name.png",
                              image_url: "http://images.com/image.png")
  end

  it "should be valid Article model" do
    expect(@article).to be_valid
  end

  it "should be have title in article page" do
    visit articles_path
    expect(page).to have_content("Portfolio")
  end

end
