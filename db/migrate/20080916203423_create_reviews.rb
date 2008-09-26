class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :reviewer
      t.text :content
      t.references :client
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
