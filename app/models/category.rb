class Category < ActiveRecord::Base
  acts_as_category
  has_and_belongs_to_many :projects
end
