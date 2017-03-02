require "rails_helper"

describe User do
  it "must be filled out with vitals" do
    user1 = User.create(first_name: "Billy",
             last_name: "Goat",
             username: "billygoat",
             password: "pass",
             address: "123 Any St, Denver, CO 80202",
             email: "billygoat@gmail.com",
             role: 1
            )
    user2 = User.create(first_name: "Billy",
             last_name: "Goat"
            )

    expect(user1).to be_valid
    expect(user2).to be_invalid
  end
end
