class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.references :imagefile
      t.boolean :is_recent

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
