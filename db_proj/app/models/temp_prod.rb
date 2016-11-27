class Temp_prod
	attr_accessor :product_name, :quantity, :mesure_unit
	def initialize(name,quant,unit)
		@product_name = name
		@quantity = quant
		@mesure_unit = unit
	end

end