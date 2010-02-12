class AddRequestInfoToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :user_ip, :string
    add_column :inquiries, :user_agent, :string
    add_column :inquiries, :referrer, :string
  end

  def self.down
    remove_column :inquiries, :referrer
    remove_column :inquiries, :user_agent
    remove_column :inquiries, :user_ip
  end
end
