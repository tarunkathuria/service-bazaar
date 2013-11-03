class CreateUsers < ActiveRecord::Migration
    def self.up
    create_table :Users, :id => false do |t|
    t.string :username, :null => false
    t.float :latitude, :null =>false
    t.float :longitude, :null => false
    t.string :realName
    t.date :dateOfBirth
    t.string :emailID, :null => false
    
    t.timestamps
end
add_index :Users, :username, :unique=> true
add_index :Users, :emailID, :unique => true

#add constraints via SQL using execute


# execute <<-SQL
#   create table users(
#	username varchar(30) primary key,
#	password varchar(20) check (len(password)>=6),
#	latitudeLocation float,
#	longitudeLocation float,
#	realName varchar(60),
#	dateOfBirth date,
#	emailID varchar(40)
#   );
#   SQL

end
def self.down
drop_table :Users
end
end
