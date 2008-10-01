# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '84b59c39a919540e0adbd7cefb9b9ec2'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  private
  
  def http_or_xhr
    request.xhr? ? "modal" : "application"
  end
  
  def permission
    unless authorized?
      flash[:notice] = "You don't look like an admin to me"
      redirect_to(home_path)
    end
  end
  
end
