# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_active_if( link_title, link_path = {}, opts = {} )
    if current_page? link_path
      classes = opts.delete(:class) || ""
      classes.rstrip!    

      # checking to see if "active" is already one of the classes assigned, and if NOT, append it to the classes string

      unless classes =~ /^(\w*\s+)*current(?!\w)/ 
        if classes.blank? 
          classes = 'current'
        else
          classes << " current"
        end         
      end    
    end

    old_opts = opts.dup

    link_to( link_title, link_path, opts.merge( {:class => classes} ) )

  end
  
end