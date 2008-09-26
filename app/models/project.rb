class Project < ActiveRecord::Base
  belongs_to :imagefile
  has_and_belongs_to_many :categories
  has_many :tabs
end
