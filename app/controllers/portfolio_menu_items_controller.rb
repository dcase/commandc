class PortfolioMenuItemsController < ApplicationController
  before_filter :permission
  
  def order
     project_list = 'project_list' + params[:project_list_id]
     params[project_list.to_sym].each_with_index do |id, position|
       PortfolioMenuItem.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
    render :text => params.inspect
   end
   
end
