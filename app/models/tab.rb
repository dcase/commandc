class Tab < ActiveRecord::Base
  belongs_to :imagefile
  belongs_to :project
end
