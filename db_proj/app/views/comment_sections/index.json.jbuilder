json.array!(@comment_sections) do |comment_section|
  json.extract! comment_section, :id, :recipe_section_id, :section_comment_id
  json.url comment_section_url(comment_section, format: :json)
end
