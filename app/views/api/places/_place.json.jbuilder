json.(place, :id, :title, :created_at, :updated_at)

json.image_urls place.place_pics do |place_pic|
  json.url asset_path(place_pics.picture.url(:large))
end