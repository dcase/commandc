class Client < ActiveRecord::Base
  has_one :review, :dependent => :destroy
  belongs_to :imagefile
  acts_as_list
  
  validates_presence_of :name
  validates_presence_of :imagefile,
    :if => Proc.new { |c| c.is_featured == true },
    :message => ": featured clients need a logo!"
end
