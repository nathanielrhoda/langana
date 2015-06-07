require 'rails_helper'

describe "Viewing an individual user" do

  it "shows the user's details" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit user_url(user)

    expect(page).to have_text(user.first_name)
    expect(page).to have_text(user.email)
  end
end
