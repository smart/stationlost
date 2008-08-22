# -*- coding: mule-utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  def create_user_forcing_confirmation options
    options[:password_confirmation] = options[:password] if options[:password]
    create_user options
  end
  #
  # Validations
  #
  describe 'validates correctly:' do
    field_validity = {
      :password => {
        :valid => ['Andre The Giant (7\'4", 520 lb.)', '6_ltrs', "Iñtërnâtiônàlizætiøn", '1234567890_234567890_234567890_234567890',],
        :invalid => [nil, '', "5ltrs", '1234567890_234567890_234567890_234567890_',]},
    }
    field_validity.each do |attr, vals|
      vals[:valid].each do |val|
        it "valid for #{attr} = '#{val}'"   do
          @user = create_user_forcing_confirmation(attr => val);
          is_valid_and_saves @user, (attr==:password ? [] : {attr => val})
        end
      end
      vals[:invalid].each do |val|
        it "invalid for #{attr} = '#{val}'" do
          @user = create_user_forcing_confirmation(attr => val);
          is_not_valid_and_does_not_save @user
        end
      end
    end
  end

  #
  # Creating a user
  #
  describe "creating a user" do
    it "requires a password"                    do @user = create_user_forcing_confirmation(:password => nil); is_not_valid_and_does_not_save @user end
    it "requires password matches confirmation" do @user = create_user(:password => 'monkey100'); is_not_valid_and_does_not_save @user end

    describe "password handled correctly:" do
      before(:each) do @user = User.new(new_user_params) end
      it "encrypts"                     do @user.should_receive(:encrypt_password) end
      it "makes salt" do
        @token = 'hiya'
        User.should_receive(:make_token).with().at_least(:once).and_return(@token)
        @user.should_receive(:salt=).with(@token).at_least(:once)
      end
      after(:each)  do @user.save end
    end
  end

  #
  # Authentication
  #
  describe "authenticate_by_password" do
    fixtures :users
    before(:each) do
      @user = users(:quentin)
    end
    it 'authenticates user with good password' do
      User.authenticate_by_password('quentin', 'monkey').should == users(:quentin)
    end
    it "raises BadPassword error on bad password" do
      @user = 'howdy'
      lambda{ @user = User.authenticate_by_password('quentin', 'i_haxxor_joo') }.should raise_error(BadPassword)
      @user.should == 'howdy'
    end
    it "raises BadPassword error on blank password" do
      @user = 'howdy';
      lambda{ @user = User.authenticate_by_password('quentin', '') }.should raise_error(BadPassword)
      @user.should == 'howdy'
    end
    it "raises AccountNotFound error on bogus user" do
      @user = 'howdy';
      lambda{ @user = User.authenticate_by_password('random_q_hacker', 'monkey') }.should raise_error(AccountNotFound)
      @user.should == 'howdy'
    end
  end

  #
  # Password encryption
  #
  describe "password" do
    fixtures :users
    before(:each) do
      @user = users(:quentin)
    end
    if REST_AUTH_SITE_KEY.blank?
      # old-school passwords
      it "encryption is compatible with old-style password" do
        User.authenticate_by_password('old_password_holder', 'test').should == users(:old_password_holder)
      end
    else
      it "encryption is not compatible with old-style password" do
        lambda{  User.authenticate_by_password('old_password_holder', 'test') }.should raise_error(BadPassword)
      end

      it "encryption stretches the password" do
        User.should_receive(:secure_digest).with(anything(), 'salt', 'plaintext', anything()).at_least(REST_AUTH_DIGEST_STRETCHES)
        User.password_digest('plaintext', 'salt')
      end

      # New installs should bump this up and set REST_AUTH_DIGEST_STRETCHES to give a 10ms encrypt time or so
      desired_encryption_expensiveness_ms = 0.1
      it "encryption takes longer than #{desired_encryption_expensiveness_ms}ms to encrypt a password" do
        test_reps = 100
        start_time = Time.now; test_reps.times{ User.authenticate_by_password('quentin', 'monkey') }; end_time   = Time.now
        auth_time_ms = 1000 * (end_time - start_time)/test_reps
        auth_time_ms.should > desired_encryption_expensiveness_ms
      end
      it "encryption doesn't make salt for old user" do
        User.should_not_receive(:make_token)
        @user.should_not_receive(:salt=)
        @user.send(:encrypt_password)
      end
      it "encrypts with salt"           do
        @user.should_receive(:salt).at_least(:once).and_return('hiya');
        @user.send(:encrypt, 'monkey69')
      end
      it 'can be set' do
        users(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
        User.authenticate_by_password('quentin', 'new password').should == users(:quentin)
      end
      it 'is not rehashed unless password is changed' do
        @user.update_attributes(:login => 'quentin2')
        User.authenticate_by_password('quentin2', 'monkey').should == @user
      end
      it "doesn't show on retrieval" do
        User.find(1).password().should be_nil
      end
    end
  end
end
