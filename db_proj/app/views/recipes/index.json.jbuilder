json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :recipe_name, :description, :recipe_writer
  json.url recipe_url(recipe, format: :json)
end
