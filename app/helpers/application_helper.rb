# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def content(partial, opts = {}, &block)
    Content.new(partial, self, opts, &block).render
  end
end
