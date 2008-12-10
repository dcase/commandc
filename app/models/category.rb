class Category < ActiveRecord::Base
  acts_as_category
  has_many :portfolio_menu_items, :order => "position"
  has_many :projects, :through => :portfolio_menu_items
  
  validates_presence_of :name
  validates_length_of :fyi, :maximum => 245, :allow_blank => true, :message => "too long (limited to %d characters)"
  
  def to_param
    "#{id}-#{name.downcase.strip.gsub(/\ /, '-').gsub(/[^\w\-]/, '').gsub(/[-]+/, '-')}"
  end
  
end
