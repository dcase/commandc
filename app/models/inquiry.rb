class Inquiry < ActiveRecord::Base
  validates_presence_of :name, :email, :description
  
  has_rakismet :author => :name, 
    :author_url => :url,
    :author_email => :email,
    :comment_type => "inquiry",
    :permalink => "http://www.commandc.com/contact-us.html/new",
    :content => :description,
    :user_ip => :user_ip,
    :user_agent => :user_agent,
    :referrer => :referrer
    
  def request=(request)
    self.user_ip    = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer   = request.env['HTTP_REFERER']
  end
    
end
