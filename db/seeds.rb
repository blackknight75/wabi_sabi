# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#-----------------------------------------------------------------------------#
category1  = Category.create(name: "Beverage")
category2  = Category.create(name: "Soda")
category3  = Category.create(name: "Kitchen")
category4  = Category.create(name: "Tea")
category5  = Category.create(name: "Sushi")
category6  = Category.create(name: "Condiment")
category7  = Category.create(name: "Alcohol")
category8  = Category.create(name: "Juice")
category9  = Category.create(name: "Food")
category10 = Category.create(name: "Cutlery")
#-----------------------------------------------------------------------------#
User.create(username: "blackknight75",
            first_name: "Daniel",
            last_name: "Olson",
            email: "devbox4714@gmailcom",
            address: "1234 1st St, Denver, CO 80202",
            password: "password",
            role: 0
           )
User.create(username: "x",
            first_name: "Sally",
            last_name: "Beans",
            email: "beansandsally@gmailcom",
            address: "4321 1st St, Denver, CO 80202",
            password: "x",
            role: 1
           )
#-----------------------------------------------------------------------------#
item1 = Item.create(
                   title: "Chopsticks",
                   description: "Wooden sticks.",
                   price: 5,
                   image: "http://i.imgur.com/RbzANbF.jpg"
                  )
item1.item_categories.create(category: category3)
#-----------------------------------------------------------------------------#
item2 = Item.create(title: "Matcha",
                   description: "Delicous and nutricious tea.",
                   price: 4,
                   image: "http://i.imgur.com/slA9HXQ.png")
item2.item_categories.create(category: category1)
item2.item_categories.create(category: category4)
#-----------------------------------------------------------------------------#
item3 = Item.create(title: "CC Lemon",
                   description: "Lemon soda.",
                   price: 2,
                   image: "http://i.imgur.com/uDgMqyU.jpg")
item3.item_categories.create(category: category1)
item3.item_categories.create(category: category2)
#-----------------------------------------------------------------------------#
item4 = Item.create(title: "Sake",
                   description: "Rice wine that's smooth as silk.",
                   price: 1,
                   image: "http://i.imgur.com/5LCOlwS.jpg")
item4.item_categories.create(category: category7)
item4.item_categories.create(category: category1)
#-----------------------------------------------------------------------------#
item5 = Item.create(title: "Yanagiba",
                   description: "The samurai sword for sushi chefs.",
                   price: 1,
                   image: "http://i.imgur.com/PmsHalM.jpg")
item5.item_categories.create(category: category5)
item5.item_categories.create(category: category3)
item5.item_categories.create(category: category10)
#-----------------------------------------------------------------------------#
item6 = Item.create(title: "Calpis",
                   description: "Creamy sweet juice.",
                   price: 3,
                   image: "http://i.imgur.com/KITkWNK.jpg")
item6.item_categories.create(category: category1)
item6.item_categories.create(category: category8)
#-----------------------------------------------------------------------------#
item7 = Item.create(title: "Hojicha",
                   description: "Mushroom tea.",
                   price: 5,
                   image: "http://i.imgur.com/DWiigvK.jpg")
item7.item_categories.create(category: category1)
item7.item_categories.create(category: category4)
#-----------------------------------------------------------------------------#
item8 = Item.create(title: "Wasabi",
                   description: "Japanese horseradish.",
                   price: 1,
                   image: "http://i.imgur.com/YUZF6yf.jpg")
item8.item_categories.create(category: category5)
item8.item_categories.create(category: category6)
item8.item_categories.create(category: category9)
#-----------------------------------------------------------------------------#
item9 = Item.create(title: "Gari",
                   description: "Pickled Ginger.",
                   price: 5,
                   image: "http://i.imgur.com/Z9vjgmu.jpg")
item9.item_categories.create(category: category5)
item9.item_categories.create(category: category6)
item9.item_categories.create(category: category9)
#-----------------------------------------------------------------------------#
item10 = Item.create(title: "Soy Sauce",
                   description: "Savory sauce made of soy beans.",
                   price: 8,
                   image: "http://i.imgur.com/EtqCGVR.jpg")
item10.item_categories.create(category: category5)
item10.item_categories.create(category: category6)
item10.item_categories.create(category: category9)
#-----------------------------------------------------------------------------#
