# encoding: utf-8

User.destroy_all
List.destroy_all
Group.destroy_all
Comment.destroy_all
Restaurant.destroy_all
Vote.destroy_all
ListRestaurant.destroy_all
ListExperience.destroy_all
CustomField.destroy_all
CustomValue.destroy_all

amir = User.create!(username: "myraisverycool", first_name: "amir", last_name: "amirslastname", password: "password", email: "amir@amir.amir")

myra = User.create!(username: "momo", first_name: "myra", last_name: "orgain", password: "123456", email: "momo@momo.com")

walter = User.create!(username: "ineedabitmoji", first_name: "walter", last_name: "white", password: "mr.white", email: "walter@walter.walter")

a_list = amir.lists.create!(title: "Amir's Tex-Mex list")

m_list = myra.lists.create!(title: "Cool SF spots")

w_list = walter.lists.create!(title: "Walter's homemade super list")

amir.build_profile
myra.build_profile
walter.build_profile

spicytacos = amir.created_groups.create!(name: "The Spicy Tacos", description: "We love spicy tacos! They're the best!")
spicytacos.members.push(myra, walter)

amirsowl = Restaurant.create!( name: "Amir's SowlFood",
                    restaurant_url: "www.amirsowl.com",
                    address: "14 amir st, Amir, Ny",
                    locality: "Chelsea",
                    city: "New York",
                    zipcode: "10023",
                    average_cost_for_two: "4",
                    featured_img: "./image/ChickenPotPie.png",
                    menu_url: "www.Amirsoul.com/menu",
                    has_online_delivery: "no",
                    cuisines: "cheap",
                    phone_numbers: "888-555-4455"
                    )

a_list << amirsowl
a_list.list_restaurant.last.update(cuisine: "german", fav_dish: "snails", restaurant_type: "SowlFood", location: "nyc", tried: true)
# a_list.list_restaurants.last.list_experiences
