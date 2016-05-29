class Bottleshape < ActiveRecord::Base
  has_many :bottleshots
  has_many :users, through: :bottleshots
  has_many :winecolor, through: :bottleshots
end