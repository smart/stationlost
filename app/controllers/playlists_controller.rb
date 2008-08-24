class PlaylistsController < SiteController
  
  make_resourceful do
    actions :all
  end
  

  private
=begin
  def current_objects
    @current_objects ||= current_model.active
  end
=end

  def current_object
    current_object = super
    current_object.clips
    current_object
  end

  def context
    'application'
  end
end