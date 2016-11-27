json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :owner_user_name, :product_id
  json.url inventory_url(inventory, format: :json)
end
