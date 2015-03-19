require 'rails_helper'

describe "the add user process" do
  before :each do
    test_user = User.create(email: "someone@something.com", password: "1234")
  end

  it "adds a new user" do
    visit "/"
    click_on "New user"
    fill_in "Email", :with => "someone1@something.com"
    fill_in "Password", :with => "1234"
    fill_in "Password confirmation", :with => "1234"
    click_on "Sign Up"
    expect(page).to have_content "Log in"
  end

  it "gives an error when password is not confirmed" do
    visit "/"
    click_on "New user"
    fill_in "Email", :with => "someone2@something.com"
    fill_in "Password", :with => "1234"
    click_on "Sign Up"
    expect(page).to have_content "There was a problem creating your account."
  end

  it "logs user in" do
    visit "/"
    click_on "Log in"
    fill_in "Email", :with => "someone@something.com"
    fill_in "Password", :with => "1234"
    click_on "Log in"
    expect(page).to have_content "You have been logged in"
  end

  it "logs the user out" do
    visit "/"
    click_on "Log in"
    fill_in "Email", :with => "someone@something.com"
    fill_in "Password", :with => "1234"
    click_on "Log in"
    click_on "Log out"
    expect(page).to have_content "You have been logged out successfully."
  end


end
