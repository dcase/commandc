class Client < ActiveRecord::Base
  has_one :review
  belongs_to :imagefile
  acts_as_list
end
