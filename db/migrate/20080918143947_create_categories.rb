class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :fyi
      t.integer :parent_id
      t.integer :position
      t.integer :children_count
      t.integer :ancestors_count
      t.integer :descendants_count

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
