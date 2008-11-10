class AddSeoToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :seo_title, :string
    add_column :categories, :seo_description, :text
    add_column :categories, :seo_keywords, :string
    add_column :categories, :seo_h1, :string
  end

  def self.down
    remove_column :categories, :seo_h1
    remove_column :categories, :seo_keywords
    remove_column :categories, :seo_description
    remove_column :categories, :seo_title
  end
end
