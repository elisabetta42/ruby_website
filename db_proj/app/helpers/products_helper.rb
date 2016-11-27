module ProductsHelper
	
  def create_prodlist
    $temp_prod_list = Array.new
  end
  def create_prod_id
  	$recipe_prod_id = Array.new
  end
  def current_recipe(id)
  	$current_recipe = id
  end
end
