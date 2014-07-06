# json.partial! 'api/places/place', place: @place
json.(@place, :id, :title,:kind,:max_guest,:price,:bed_type, :created_at, :updated_at)

json.pictures @place.place_pics do |place_pic|
  json.url asset_path(place_pic.picture.url(:large))
end