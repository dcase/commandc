class StaticController < ApplicationController
  def home
    @recent_projects = Project.find_all_by_is_recent(true, :order => :recent_position)
  end

  def about
  end
  
  def unrecognized
  end

end
