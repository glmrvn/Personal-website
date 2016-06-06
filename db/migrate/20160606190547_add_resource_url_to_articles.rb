class AddResourceUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :resource_url, :string
  end
end
