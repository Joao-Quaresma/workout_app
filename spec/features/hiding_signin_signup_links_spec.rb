require "rails_helper"

RSpec.feature "Hiding signup and signin" do
  before do
    @john = User.create(email: "john@something.com", password: "password")
  end

  scenario "sign in and sign up urls successfully hided" do
    visit "/"

    click_link "Sign in"

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
    expect(page).to have_link("Sign out")
  end

  scenario "sign in and sign up urls still showing after failed login" do
    visit "/"

    click_link "Sign in"

    fill_in "Email", with: @john.email
    fill_in "Password", with: "sdfsdfsdfsdf"
    click_button "Log in"

    expect(page).to have_link("Sign in")
    expect(page).to have_link("Sign up")
    expect(page).not_to have_link("Sign out")
  end
end
