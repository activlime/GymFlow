class Workout < ActiveRecord::Base
  belongs_to :program
  has_many :exercises
end
