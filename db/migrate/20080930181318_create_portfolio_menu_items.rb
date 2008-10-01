class CreatePortfolioMenuItems < ActiveRecord::Migration
  def self.up
    create_table :portfolio_menu_items do |t|
      t.references :category
      t.references :project
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :portfolio_menu_items
  end
end
