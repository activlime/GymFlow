class Program < ActiveRecord::Base
  belongs_to :user
  has_many :workouts
end
