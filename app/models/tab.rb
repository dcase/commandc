class Tab < ActiveRecord::Base
  belongs_to :imagefile
  belongs_to :project
  acts_as_list :scope => :project
  
  validates_presence_of :title
  validates_presence_of :imagefile,  :message => ": A file must be selected"
end
