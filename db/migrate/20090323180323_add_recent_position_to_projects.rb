class AddRecentPositionToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :recent_position, :integer
  end

  def self.down
    remove_column :projects, :recent_position
  end
end
