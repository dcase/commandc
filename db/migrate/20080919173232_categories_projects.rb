class CategoriesProjects < ActiveRecord::Migration
  def self.up
    create_table :categories_projects, :id => false, :force => true do |t|
                t.integer :category_id
                t.integer :project_id
                t.timestamps
            end
  end

  def self.down
    drop_table :categories_projects
  end
end
