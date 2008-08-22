require File.dirname(__FILE__) + '/../spec_helper'

describe Identity::CookieToken do
  before(:each) do
    # set up module rig
    @mock_model_class = Class.new do
      include Identity, Identity::CookieToken
    end
    @user = @mock_model_class.new
  end

  #
  # remember_token?
  #
  describe "remember_token?" do
    before(:all) do
      @future = 5.minutes.from_now.utc
      @past   = 5.minutes.ago.utc
    end
    def set_remember_token token, expiry
      @user.stub!(:remember_token).and_return( token )
      @user.stub!(:remember_token_expires_at).and_return( expiry )
    end
    it "is true for valid, unexpired token" do set_remember_token 'valid_token', @future; @user.should     be_remember_token end
    it "is false for remember_token nil"    do set_remember_token nil, @future;           @user.should_not be_remember_token end
    it "is false for remember_token ''"     do set_remember_token '',  @future;           @user.should_not be_remember_token end
    it "is false for expired"               do set_remember_token 'valid_token', @past;   @user.should_not be_remember_token end
    it "is false for unset"                 do set_remember_token 'valid_token', nil;     @user.should_not be_remember_token end
  end

  #
  # Setting / Refreshing token
  #
  describe "remember_me_until" do
    it "makes a token" do
      @mock_model_class.should_receive(:make_token).and_return('valid_token')
      @user.should_receive(:remember_token=).with('valid_token')
      @user.should_receive(:remember_token_expires_at=).with('time')
      @user.should_receive(:save).with(false).and_return('result')
      @user.remember_me_until('time').should == 'result'
    end
  end
  describe "refresh_token" do
    it "refreshes valid token, keeping expiry" do
      @user.should_receive(:remember_token?).and_return(true)
      @mock_model_class.should_receive(:make_token).and_return('valid_token')
      @user.should_receive(:remember_token=).with('valid_token')
      @user.should_not_receive(:remember_token_expires_at=)
      @user.should_receive(:save).with(false).and_return('result')
      @user.refresh_token.should == 'result'
    end
    it "does nothing for invalid token" do
      @user.should_receive(:remember_token?).and_return(false)
      @mock_model_class.should_not_receive(:make_token)
      @user.should_not_receive(:remember_token=)
      @user.should_not_receive(:remember_token_expires_at=)
      (@user.refresh_token||false).should be_false
    end
  end

  #
  # Forget me
  #
  describe "forget_me" do
    it "kills token" do
      @user.should_receive(:remember_token_expires_at=).with(nil)
      @user.should_receive(:remember_token=).with(nil)
      @user.should_receive(:save).and_return('who_am_i')
      @user.forget_me.should == 'who_am_i'
    end
  end
end

describe User do
  #
  # Authentication
  #
  describe "From fixtures" do
    fixtures :users
    it 'sets remember token' do
      users(:quentin).remember_me
      users(:quentin).remember_token.should_not be_nil
      users(:quentin).remember_token_expires_at.should_not be_nil
    end

    it 'unsets remember token' do
      users(:quentin).remember_me
      users(:quentin).remember_token.should_not be_nil
      users(:quentin).forget_me
      users(:quentin).remember_token.should be_nil
    end

    it 'remembers me for one week' do
      before = 1.week.from_now.utc
      users(:quentin).remember_me_for 1.week
      after = 1.week.from_now.utc
      users(:quentin).remember_token.should_not be_nil
      users(:quentin).remember_token_expires_at.should_not be_nil
      users(:quentin).remember_token_expires_at.between?(before, after).should be_true
    end

    it 'remembers me until one week' do
      time = 1.week.from_now.utc
      users(:quentin).remember_me_until time
      users(:quentin).remember_token.should_not be_nil
      users(:quentin).remember_token_expires_at.should_not be_nil
      users(:quentin).remember_token_expires_at.should == time
    end

    it 'remembers me default two weeks' do
      before = 2.weeks.from_now.utc
      users(:quentin).remember_me
      after = 2.weeks.from_now.utc
      users(:quentin).remember_token.should_not be_nil
      users(:quentin).remember_token_expires_at.should_not be_nil
      users(:quentin).remember_token_expires_at.between?(before, after).should be_true
    end
  end
end
