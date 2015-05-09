require 'rails_helper'

describe Article do

  article = Article.create(title: "Title here",
                           text: "Text here",
                           image_file_name: "file_name.png")

  it "should be valid Article model" do
    expect(article).to be_valid
  end

  it "should be have h1 eq title in article page" do
    visit '/articles/1' 
    expect(page).to have_content(article.title)
  end


end
