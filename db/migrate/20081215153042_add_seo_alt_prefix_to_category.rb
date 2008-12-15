class AddSeoAltPrefixToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :seo_alt_prefix, :string
  end

  def self.down
    remove_column :categories, :seo_alt_prefix
  end
end
