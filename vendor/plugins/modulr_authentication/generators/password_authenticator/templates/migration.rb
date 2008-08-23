class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string, :limit => 100
    add_column :users, :crypted_password, :string,  :limit => 40
    add_column :users, :salt, :string, :limit => 40
  end
  
  def self.down
    remove_column :users, :login
    remove_column :users, :crypted_password
    remove_column :users, :salt
  end
  
end