class UsersController < ApplicationController

  # render new.rhtml
  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      become_logged_in_as @user # logs in if authorized, does nothing if not
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      @user.password = ''
      @user.password_confirmation = ''
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  # There's no page here to update or destroy a user.  If you add those, be
  # smart -- make sure you check that the visitor is authorized to do so, that they
  # supply their old password along with a new one to update it, etc.
  #
  # And if you add restful formatted paths, make sure you filter your response:
  #   format.xml do
  #     render :xml => @user.toxml(:only => [:name, :email, :login])
  #   end

protected

end
