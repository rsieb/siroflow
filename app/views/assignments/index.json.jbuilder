json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :name, :url, :planned_start, :duration, :notes
  json.url assignment_url(assignment, format: :json)
end
