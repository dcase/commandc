class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.string :name
      t.string :timeframe
      t.string :email
      t.string :budget
      t.string :phone
      t.string :reachable_at
      t.string :url
      t.string :source
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end
