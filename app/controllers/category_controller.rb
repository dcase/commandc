class CategoryController < ApplicationController
  layout :http_or_xhr
  
  def update_positions
    Category.update_positions(params)
    render :nothing => true
  end

end
