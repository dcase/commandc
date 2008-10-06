class Client < ActiveRecord::Base
  has_one :review, :dependent => :destroy
  belongs_to :imagefile
  acts_as_list
  
  validates_presence_of :name, :url
end
