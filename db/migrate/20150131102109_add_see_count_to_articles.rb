class AddSeeCountToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :see_count, :integer, default: 0
  end
end
