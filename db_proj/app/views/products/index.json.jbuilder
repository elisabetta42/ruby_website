json.array!(@products) do |product|
  json.extract! product, :id, :prod_name, :quantity, :mesure_unit
  json.url product_url(product, format: :json)
end
