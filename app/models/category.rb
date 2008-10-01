class Category < ActiveRecord::Base
  acts_as_category
  has_many :portfolio_menu_items, :order => "position"
  has_many :projects, :through => :portfolio_menu_items
    
end
