class PortfolioMenuItem < ActiveRecord::Base
  acts_as_list :scope => :category
  belongs_to :project
  belongs_to :category
end
