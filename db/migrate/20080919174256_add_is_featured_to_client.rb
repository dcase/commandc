class AddIsFeaturedToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :is_featured, :boolean
  end

  def self.down
    remove_column :clients, :is_featured
  end
end
