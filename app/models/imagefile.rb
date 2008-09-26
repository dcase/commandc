class Imagefile < ActiveRecord::Base
  has_attachment :content_type => :image, :thumbnails => { :client_logo => '95x95', :project_thumb => '175x175'}, :path_prefix => "public/files", :storage => :file_system
  has_one :client, :dependent => :nullify
  has_one :project, :dependent => :nullify
  has_one :tab, :dependent => :nullify
end
