class Topic < ActiveRecord::Base
  has_many :posts

  has_many :labelings, as: :labelable

  has_many :labels, through: :labelings
end
