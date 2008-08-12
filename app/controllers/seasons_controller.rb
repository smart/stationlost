class SeasonsController < SiteController
  
  make_resourceful do
    actions :all
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
end