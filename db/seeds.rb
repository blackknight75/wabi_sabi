# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
item1 = Item.create(title: "Chopsticks",
                    description: "Wooden sticks.",
                    price: 100)
item2 = Item.create(title: "Macha",
                    description: "Delicous and nutricious tea.",
                    price: 100)
item3 = Item.create(title: "CC Lemon",
                    description: "Lemon soda.",
                    price: 100)
category1 = Category.create(name: "Beverage")
category2 = Category.create(name: "Soda")
category3 = Category.create(name: "Kitchen")
category4 = Category.create(name: "Tea")

item1.item_categories.create(category: category3)
item2.item_categories.create(category: category1)
item2.item_categories.create(category: category4)
item3.item_categories.create(category: category1)
item3.item_categories.create(category: category2)
