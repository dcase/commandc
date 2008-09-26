class StaticController < ApplicationController
  def home
    @recent_projects = Project.find_all_by_is_recent(true)
  end

  def about
  end

end
