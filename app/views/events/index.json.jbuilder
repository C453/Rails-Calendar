json.array!(@events) do |event|
  json.extract! event, :id, :title, :allDay, :start, :end, :color, :description, :credits, :chapter, :location
  json.url event_url(event, format: :json)
end
