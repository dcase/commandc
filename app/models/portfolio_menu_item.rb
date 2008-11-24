class PortfolioMenuItem < ActiveRecord::Base
  acts_as_list :scope => :category
  belongs_to :project, :order => 'position'
  belongs_to :category, :order => 'position'
end
