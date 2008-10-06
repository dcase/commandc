module StaticHelper
  def get_blog_posts
    require 'simple-rss'
    require 'open-uri'
    
    begin
    feed = SimpleRSS.parse open( 'http://commandc.com/blog1/feed' )
    
    output = "<div id=\"blog_posts\">"
    output += image_tag('blog-separator-1.gif', :size => "111x60")
    output += "<div class=\"blog-post\">>> " + link_to(truncate(feed.items[0].description, 75),{},:href => feed.items[0].link, :target => "_blank" ) + "</div>"
    output += image_tag('blog-separator-2.gif', :size => "74x60")
    output += "<div class=\"blog-post\">>> " + link_to(truncate(feed.items[1].description, 75),{},:href => feed.items[1].link, :target => "_blank" ) + "</div>"
    output += "</div>"
    rescue OpenURI::HTTPError => e
      output = e
    end
    
    output
    
  end
    
end
