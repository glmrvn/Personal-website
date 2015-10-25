require 'rails_helper'

describe Article do

  before do
    @article = Article.create(title:           "Title here",
                              text:            "Text here",
                              image_file_name: "file_name.png",
                              image_url:       "http://images.com/image.png")
  end

  it "Should be valid Article model" do
    expect(@article).to be_valid
  end

  describe "Should not be valid Article model" do
    before { @article.title =  @article.text = "  " }
    it { should_not be_valid }
  end

  it "Should be have title in article page" do
    visit articles_path
    expect(page).to have_content("Portfolio")
  end

  it "Should be have link to main page in article page" do
    visit article_path(@article)
    expect(page).to have_link("MAIN PAGE", href: root_path)
  end

end
