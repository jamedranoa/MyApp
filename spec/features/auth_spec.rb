feature "Sign up proccess" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end
end