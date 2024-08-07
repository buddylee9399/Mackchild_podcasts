json.extract! podcast, :id, :title, :description, :itunes, :stitcher, :podbay, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
