# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  servings   :integer
#  cook_time  :integer
#  calories   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Recipe < ActiveRecord::Base
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :liked_by, through: :likes

  def like_count
    likes.count
  end

  def top_recipe?
    true
  end
end
