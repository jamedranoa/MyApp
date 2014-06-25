module PlacesHelper
  def place_unvisible_attribute(att)
    (att.include?("id") || att.include?("_at"))
  end
end
