json.array!(@recipe_prods) do |recipe_prod|
  json.extract! recipe_prod, :id, :recipes_id, :prods_id
  json.url recipe_prod_url(recipe_prod, format: :json)
end
