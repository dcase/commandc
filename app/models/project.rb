class Project < ActiveRecord::Base
  belongs_to :imagefile
  has_many :portfolio_menu_items, :dependent => :destroy, :order => "position"
  has_many :categories, :through => :portfolio_menu_items
  has_many :tabs, :order => "position", :dependent => :destroy
  
  acts_as_list :scope => "is_recent = 1", :column => :recent_position
  
  validates_presence_of :name, :categories
  validates_presence_of :imagefile,
    :if => Proc.new { |p| p.is_recent == true },
    :message => ": recent projects need a thumbnail"
    
  def to_param
    "#{id}-#{name.downcase.strip.gsub(/\ /, '-').gsub(/[^\w\-]/, '').gsub(/[-]+/, '-')}"
  end
end
