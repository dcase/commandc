class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.string :title
      t.text :content
      t.references :imagefile
      t.references :project
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
