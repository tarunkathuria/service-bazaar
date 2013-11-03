class User < ActiveRecord::Base
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :username, :presence => true, :uniqueness => { :case_sensitive => false}
    validates :emailID, :presence => true, :uniqueness => { :case_sensitive => false}, :format => { :with => email_regex }
    
    
    
end
