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
    within '.item-management' do
      expect(page).to have_content 'Add New Item to Inventory'
    end
    within '.manage-orders' do
      expect(page).to have_content 'Manage Orders'
    end
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

    visit'/admin/dashboard'
    expect(page).to have_content 'Errors 404'

  end
end
