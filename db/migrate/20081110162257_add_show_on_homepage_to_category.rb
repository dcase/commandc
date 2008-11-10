class AddShowOnHomepageToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :show_on_homepage, :boolean, :default => 1
  end

  def self.down
    remove_column :categories, :show_on_homepage
  end
end
