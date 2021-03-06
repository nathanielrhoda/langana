require 'rails_helper'
require 'support/authentication'

describe "Deleting a user" do 
  xit "destroys the user and redirects to the home page" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit user_path(user)

    click_button 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Account successfully deleted!')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out that user" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(page).to have_link('Sign In')
    expect(page).not_to have_link('Sign Out')
  end

end
