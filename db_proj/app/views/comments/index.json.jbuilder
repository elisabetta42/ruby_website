json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment_text, :refers_to, :comment_user
  json.url comment_url(comment, format: :json)
end
