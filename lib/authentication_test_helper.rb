module AuthenticationTestHelper

  # Sets the current user in the session from the given user
  def login_as(user)
    @request.session[:user_id] = user ? users(user).id : nil
  end

  # Fakes login by HTTP basic (or prevents it, with user==nil)
  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'monkey') : nil
  end

  def new_user_params
    {
      :login => 'quire',
      :email => 'quire@example.com',
      :name  => 'Preachen Quire II',
      :password => 'quire69', :password_confirmation => 'quire69',
    }
  end
  # for model testing
  def create_user(options = {})
    record = User.new(new_user_params.merge(options))
    record.save
    record
  end


  # mock model for isolation testing
  def mock_user(options = {})
    options.reverse_merge! :errors  => [],
      :to_xml  => "User-in-XML",
      :to_json => "User-in-JSON"
    user = mock_model(User, options)
  end

  # convenience method for validation specs
  def is_not_valid_and_does_not_save obj
    obj.should_not        be_valid
    obj.save.should       be_false
    obj.errors.should_not be_empty
  end
  def is_valid_and_saves obj, attrs=[]
    obj.should            be_valid
    obj.save.should_not   be_false
    obj.errors.should     be_empty
    attrs.each do |attr, val|
      obj[attr].should == val
    end
  end

  # test modules in isolation by faking a barebones controller
  def mock_authentication_controller
    # set up module rig
    mock_controller_class = Class.new do
      stub!(:rescue_from)
      include Authentication, AccessControl, SecurityPolicy
    end
    # Fake a controller
    mock_controller = mock_controller_class.new
    mock_controller.stub!(:session).and_return( {} )
    mock_controller.stub!(:reset_session)
    [mock_controller, mock_controller_class]
  end

  def stub_auth!(ctrlr, val)
    ctrlr.stub!(:get_authorization).and_return(val)
  end
  
end
