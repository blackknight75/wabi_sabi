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
