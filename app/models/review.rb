class Review < ActiveRecord::Base
  belongs_to :client
  acts_as_list
end
