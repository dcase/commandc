class DropCategoriesProjects < ActiveRecord::Migration
  def self.up
    drop_table :categories_projects
  end
  
  def self.down
    create_table :categories_projects, :id => false, :force => true do |t|
                t.integer :category_id
                t.integer :project_id
                t.timestamps
            end
  end
end
