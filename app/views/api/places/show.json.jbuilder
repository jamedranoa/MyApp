# json.partial! 'api/places/place', place: @place
json.(@place, :id, :owner_id,:title,:kind,:max_guest,:price,:bed_type, :num_beds, :created_at, :updated_at, :description)

json.pictures @place.place_pics do |place_pic|
  json.url asset_path(place_pic.picture.url(:large))
end