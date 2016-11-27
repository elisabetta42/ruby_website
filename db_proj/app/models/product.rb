class Product < ActiveRecord::Base
	belongs_to :inventory
	validates :prod_name, presence: true
	validates :quantity, numericality: { only_integer: true }
	belongs_to :inventory
end
