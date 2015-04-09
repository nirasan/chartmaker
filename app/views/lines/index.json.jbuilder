json.array!(@lines) do |line|
  json.extract! line, :id, :user_id, :diagram_id, :node_id, :next_node_id, :description
  json.url line_url(line, format: :json)
end
