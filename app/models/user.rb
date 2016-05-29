class User < ActiveRecord::Base
  has_many :bottleshots
  has_many :winecolors, through: :bottleshots
  has_many :bottleshapes, through: :bottleshots
  has_secure_password

  def slug
    User.name.split(" ").each do |t|
      t.downcase
    end.join("-")
  end

  def self.find_by_slug(slug)
    User.all.find {|t| t.slug == slug}
  end
end