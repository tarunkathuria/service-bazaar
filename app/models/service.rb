class Service < ActiveRecord::Base
  belongs_to :user
  has_many :listings

  has_many :liesins
  has_many :categories, :through => :liesins
end
