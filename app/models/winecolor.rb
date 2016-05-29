class Winecolor < ActiveRecord::Base
  has_many :bottleshots
  has_many :users, through: :bottleshots
  has_many :bottleshapes, through: :bottleshots
end