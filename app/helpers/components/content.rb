class Content
  
  def initialize(partial, template, opts = {}, &block)
    @partial, @template, @opts = partial, template, opts
    @block = @template.capture(&block)
  end
  
  def render
    layout = "shared/patterns/#{@partial}"
    
    @template.render :layout => layout, :locals => filter_options do
      @block
    end
  end
  
  def filter_options
    internal_id = @opts[:internal_id] ? "id=\"#{@opts[:internal_id]}\" " : nil
    external_id = @opts[:external_id] ? "id=\"#{@opts[:external_id]}\" " : nil
    box_class = @opts[:box_class] ? @opts[:box_class] + " round box" : "round box"
    
    @opts.merge!( :external_id => external_id, :internal_id => internal_id, :box_class => box_class )
  end
  
end