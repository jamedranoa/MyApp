module UsersHelper

  def unvisible_attribute(attri)
    (attri == "password_digest" || attri=="session_token"|| attri.include?("_at")|| attri.include?("name")||attri == "id")
  end

end
