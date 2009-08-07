module StaticHelper
  def get_blog_posts
    require 'simple-rss'
    require 'open-uri'
    
    begin
    feed = SimpleRSS.parse open( 'http://blog.commandc.com/feed' )
    
    output = "<div id=\"blog_posts\">"
    output += image_tag('blog-separator.gif', :size => "111x61", :alt => "Newest Blog Post")
    output += "<div class=\"blog-post\">" + link_to(truncate(feed.items[0].description, 75),{},:href => feed.items[0].link, :target => "_blank" ) + "</div>"
    rescue OpenURI::HTTPError => e
      output = e
    end
    
    begin
    twitter = Twitter::Base.new('info@commandc.com','commandc50').timeline(:user).first
    
    output += image_tag('twitter-separator.gif', :size => "94x61", :alt => "Twitter")
    output += "<div class=\"blog-post\">" + link_to(truncate(twitter.text, 75),{},:href => "http://twitter.com/commandc", :target => "_blank" ) + "</div>"
    output += "</div>"
    
    rescue
    
    output += image_tag('twitter-separator.gif', :size => "94x61", :alt => "Twitter")
    output += "<div class=\"blog-post\">" + "Twitter is down!" + "</div>"
    output += "</div>"
      
    end
    
    output
    
  end
    
end
