class SiteController < ApplicationController
  #before_filter :login_required, :except => [:show, :list, :index]
  layout :context
  
  private
  
  def manage resource
    instance_variable_set(:"@#{controller_name}", resource)
  end
  
  def context
    action_name == 'show' ? 'application' : 'admin'
  end
  
end
