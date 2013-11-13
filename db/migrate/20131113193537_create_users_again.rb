class CreateUsersAgain < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # t.has_many :services

      t.string :username, :null => false
      t.float :latitude, :null =>false
      t.float :longitude, :null => false
      t.string :realName
      t.date :dateOfBirth
      t.string :emailID, :null => false
      t.string :remember_token
      t.string :password
      
      t.timestamps
    end

add_index :users, :remember_token
add_index :users, :username, :unique=> true
add_index :users, :emailID, :unique => true

end
def self.down
drop_table :users
end
end
