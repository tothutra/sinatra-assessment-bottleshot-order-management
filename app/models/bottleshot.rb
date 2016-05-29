class Bottleshot < ActiveRecord::Base
  belongs_to :user
  belongs_to :winecolor
  belongs_to :bottleshape
end