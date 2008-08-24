# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def content(partial, opts = {}, &block)
    Content.new(partial, self, opts, &block).render
  end
  
  def authorized?
    true
  end
  
  def admin?
    false
  end
  
  def clip_box(object, context, items, active_items, link=true)
    box_string = "<div id=\"#{object.class}_#{context}_tagbox\" class=\"tagbox\">"
    box_string << "<ul>"
        items.each do |item|
          box_string << "<li id=\"#{object.class}_#{context}_#{item}_tag\" class=\"#{active_items.include?(item) ? "active_tag" : "inactive_tag"}\">" 
          box_string <<  (link ? link_to_remote(item, :url => toggle_tag_url(object, context, item)) : item)
          box_string << "</li>"
        end
    box_string << "</ul>" 
    box_string << "</div>"
    return box_string
  end
  
  def toggle_tag_url(object, content, item)
    "/#{object.class}/#{object.id}/#{content}/#{item}"
  end
end
