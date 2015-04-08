json.array!(@diagrams) do |diagram|
  json.extract! diagram, :id, :user_id, :title, :description
  json.url diagram_url(diagram, format: :json)
end
