class AddFeaturedPositionToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :featured_position, :integer
  end

  def self.down
    remove_column :clients, :featured_position
  end
end
