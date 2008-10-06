class Project < ActiveRecord::Base
  belongs_to :imagefile
  has_many :portfolio_menu_items, :dependent => :destroy
  has_many :categories, :through => :portfolio_menu_items
  has_many :tabs, :order => "position", :dependent => :destroy
  
  validates_presence_of :name, :categories
end
