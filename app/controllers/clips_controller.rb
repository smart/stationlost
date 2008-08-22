class ClipsController < SiteController
  
  make_resourceful do
    actions :all
    before :index do 
      @current_objects = Clip.tagged_with(params[:clip_search][:tags], :on => :tags) if params[:clip_search] && params[:clip_search][:tags] && !params[:clip_search][:tags].empty?
    end  
      
  end
  

  private
=begin
  def current_objects
    @current_objects ||= current_model.active
  end
=end
  def context
    action_name == 'index' ? 'application' : super
  end
  
  #  @current_objects ||= 
end