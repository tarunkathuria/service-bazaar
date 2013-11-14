class Liesin < ActiveRecord::Base
  # This model is used as an intermediary model between services and categories
  # The reason is that the Rails team, for reasons best known to themselves, deprecated
  # the method has_and_belong_to_many
  # I mean, seriously?

  belongs_to :categories
  belongs_to :services
end
