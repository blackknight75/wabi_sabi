require "rails_helper"

describe Item do
  it "does not allow item title to be the same" do
    item1 = Item.create(title: "Matcha",
                description: "Green Tea",
                price: 100)
    item2 = Item.create(title: "Matcha",
                description: "Wood Tools",
                price: 50)
    expect(item1).to be_valid
    expect(item2).to be_invalid
  end
end
