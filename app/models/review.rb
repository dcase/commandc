class Review < ActiveRecord::Base
  belongs_to :client
  acts_as_list
  
  validates_presence_of :reviewer, :content, :client
end
