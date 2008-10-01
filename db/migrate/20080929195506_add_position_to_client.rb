class AddPositionToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :position, :integer
  end

  def self.down
    remove_column :clients, :position
  end
end
