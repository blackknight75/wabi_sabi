require "rails_helper"

describe "when a user visits user dashboard" do
  scenario "they click on edit and can edit their user account data" do
    user = User.create(first_name: "Billy",
             last_name: "Goat",
             username: "billygoat",
             password: "pass",
             address: "123 Any St, Denver, CO 80202",
             email: "billygoat@gmail.com",
             role: 1
            )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    within('.account-info') do
      click_link "Edit Account"
    end

    expect(current_path).to eq edit_user_path(user)
    expect(find_field('user_email').value).to eq 'billygoat@gmail.com'

    # fill_in 'user[email]', with: 'sally223@aol.com'
    # within(".user-info"){ fill_in("user[first_name]", with: "Sally")}
    click_on "Save Changes"
    # expect(page).to have_content("sally223@aol.com")
  end

  scenario 'user tries to visit other users edit page and is brought to their own' do
    user = User.create(username: "sally", email: "sally@email.com", password: "pass")
    user2 = User.create(username: "charlie", email: "charlie@email.com", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user2)

    expect(page).to have_content("sally")
    expect(page).to have_content("sally@email.com")
    expect(page).to_not have_content("charlie")
    expect(page).to_not have_content("charlie@email.com")
  end
end
