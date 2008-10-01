class Tab < ActiveRecord::Base
  belongs_to :imagefile
  belongs_to :project
  acts_as_list :scope => :project
end
