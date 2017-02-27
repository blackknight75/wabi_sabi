require 'rails_helper'

RSpec.feature "accesses the dashboard" do
  scenario "admin can access the admin dashboard" do

    User.create(first_name: "Billy",
             last_name: "Goat",
             username: "billygoat",
             password: "pass",
             address: "123 Any St, Denver, CO 80202",
             email: "billygoat@gmail.com",
             role: 0
            )

    visit root_path
    click_on 'Login'
    fill_in 'Username', with: 'billygoat'
    fill_in 'Password', with: 'pass'
    within('.login-form') do
      click_on 'Login'
    end
    expect(current_path).to eq admin_dashboard_path
    within 'h2' do
      expect(page).to have_content 'Admin Dashboard'
    end
    expect(page).to have_content 'Manage Users'
    expect(page).to have_content 'Manage Items'
  end

  scenario "user cannot access the admin dashboard" do

    User.create(first_name: "Billy",
             last_name: "Goat",
             username: "billygoat",
             password: "pass",
             address: "123 Any St, Denver, CO 80202",
             email: "billygoat@gmail.com",
             role: 1
            )

    visit root_path
    click_on 'Login'
    fill_in 'Username', with: 'billygoat'
    fill_in 'Password', with: 'pass'
    within('.login-form') do
      click_on 'Login'
    end
    expect(current_path).to eq dashboard_path
    within 'h2' do
      expect(page).to have_content 'My Account'
    end
    expect(page).to_not have_content 'Manage Users'
    expect(page).to_not have_content 'Manage Items'
  end
end

# As an Admin
# When I visit "/admin/dashboard"
# I will see a heading on the page that says "Admin Dashboard"
# As a registered user
# When I visit "/admin/dashboard"
# I get a 404
# As an unregistered user
# When I visit "/admin/dashboard"
# I get a 404
