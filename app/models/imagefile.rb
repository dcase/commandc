class Imagefile < ActiveRecord::Base
  has_attachment :content_type => :image, :resize_to => '450x450>', :thumbnails => { :client_logo => '95x95>', :project_thumb => '225x225>'}, :path_prefix => "public/files", :storage => :file_system
  has_one :client, :dependent => :nullify
  has_one :project, :dependent => :nullify
  has_one :tab, :dependent => :nullify
  
  validates_as_attachment
end
