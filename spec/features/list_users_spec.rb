require 'rails_helper'

describe "Viewing the list of users" do

  it "shows only the worker users with confirmed mobile numbers" do
    legit_worker1 = FactoryGirl.create(:user, role: :worker, first_name: "LegitOne", mobile_number: "0791237894", service: "Building")
    legit_worker2 = FactoryGirl.create(:user, role: :worker, first_name: "LegitTwo", mobile_number: "0791237895", service: "Electrical")
    legit_worker3 = FactoryGirl.create(:user, role: :worker, first_name: "LegitThree", mobile_number: "0791237896", service: "Nannying")
    employer = FactoryGirl.create(:user, role: :employer, first_name: "Emplo",   mobile_number: "0799999999")
    unconfirmed_worker = FactoryGirl.create(:user, role: :worker, first_name: "Unconfirmedworker", mobile_number: "0791239632", confirmed_at: nil)

    visit users_url
    expect(page).to have_link(legit_worker1.first_name)
    expect(page).to have_text(legit_worker1.service)
    expect(page).to have_link(legit_worker2.first_name)
    expect(page).to have_link(legit_worker3.first_name)
    expect(page).not_to have_link(employer.first_name)
    expect(page).not_to have_link(unconfirmed_worker.first_name)
  end
end


