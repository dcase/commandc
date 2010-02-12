class AddIsSpamToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :is_spam, :boolean, :null => false, :default => false
    Inquiry.update_all("is_spam=0")
  end

  def self.down
    remove_column :inquiries, :is_spam
  end
end
