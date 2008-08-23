class <%= class_name %> < ActiveRecord::Base
 # This is not enabled you must add :password to identity to use password authentication
 # security_components :security_policy,
 #  :trustification => [],
 #  :identity       => [:password, :cookie_token, :simple_roles]

  # Validation constants are in config/initializers/rest_auth_config.rb
  validates_presence_of     :identifier
  validates_length_of       :identifier,    :within => 3..40
  validates_uniqueness_of   :identifier,    :case_sensitive => false
  validates_format_of       :identifier,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

  validates_length_of       :name,     :maximum => 100
  validates_format_of       :name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD

  # prevents a visitor from submitting a crafted form that bypasses activation
  # anything else you want your visitor to change should be added here.
  attr_accessible :identifier, :email, :name

end
