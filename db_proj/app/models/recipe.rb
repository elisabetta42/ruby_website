class Recipe < ActiveRecord::Base
  validates :description, presence: true 
 validates :recipe_name, presence: true
end
