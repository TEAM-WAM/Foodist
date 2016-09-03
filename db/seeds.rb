# encoding: utf-8

# Scrub db tables upon reseed
User.destroy_all
Profile.destroy_all
List.destroy_all
Group.destroy_all
Comment.destroy_all
Restaurant.destroy_all
Vote.destroy_all
ListRestaurant.destroy_all
ListExperience.destroy_all
CustomField.destroy_all
CustomValue.destroy_all

# Zomato API wrapper
zomato = Zomato::Base.new('f5e327252d7eaeb8a135c2804646707d')

# Create 3 users for Team WAM
amir = User.create!(username: "atawfik", first_name: "Amir", last_name: "Tawfik", password: "password", email: "amir@gmail.com")
myra = User.create!(username: "momo", first_name: "Myra", last_name: "Orgain", password: "123456", email: "myra@gmail.com")
walter = User.create!(username: "wchabla", first_name: "Walter", last_name: "Chabla", password: "mr.white", email: "walter@gmail.com")

# Create 20 random users
20.times do 
     User.create!(username: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password", email: Faker::Internet.email)
end

# Create 1 list per Team Wam user
a_list = amir.lists.create!(title: "Amir's Soul Food list")
m_list = myra.lists.create!(title: "Cool SF Spots")
w_list = walter.lists.create!(title: "Walter's Tex-Mex list")

# Create 6 additional lists for Amir
list_titles = ["Places with the Spiciest Food", "My Favorite Restaurants Ever", "Places to take Mom & Pop", "Experimental Foods", "Restaurants I'll never visit again", "Pet friendly restaurants!"]
list_titles.map do |list|
     amir.lists.create!(title: list)
end

# Construct 1 profile per user
users = User.all
users.map do |user|
     user.build_profile
end

# Create 1 group, creator Amir
spicytacos = amir.created_groups.create!(name: "The Spicy Tacos", description: "We love spicy tacos! They're the best!")
spicytacos.members.push(myra, walter)

# Create 1 group, creator Myra
bobafans = myra.created_groups.create!(name: "Boba Fans", description: "If you love tapioca bubble drinks, this is the group for you!")
bobafans.members.push(amir, walter)

# Create Amir's specialty restaurant
amirsowl = Restaurant.create!( name: "Amir's SowlFood",
                    restaurant_url: "www.amirsowl.com",
                    address: "14 amir st, Amir, Ny",
                    locality: "Chelsea",
                    city: "New York",
                    zipcode: "10023",
                    average_cost_for_two: "40",
                    featured_img: "./image/ChickenPotPie.png",
                    menu_url: "www.Amirsoul.com/menu",
                    has_online_delivery: "no",
                    cuisines: "cheap",
                    phone_numbers: "888-555-4455"
                    )

# Seed featured restaurants
featured_restaurants = Zomato::Restaurant.search(280, entity_type: 'city', collection_id: '1')
featured_restaurants.map do |restaurant|
     Restaurant.create!( name: restaurant.restaurants.name,
                    restaurant_url: restaurant.restaurants.url,
                    address: restaurant.restaurants.location.address,
                    locality: restaurant.restaurants.location.locality,
                    city: restaurant.restaurants.location.city,
                    zipcode: restaurant.restaurants.location.zipcode,
                    average_cost_for_two: restaurant.restaurants.average_cost_for_two,
                    featured_img: restaurant.restaurants.featured_image,
                    menu_url: restaurant.restaurants.menu_url,
                    has_online_delivery: restaurant.restaurants.has_online_delivery,
                    cuisines: restaurant.restaurants.cuisines,
                    phone_numbers: restaurant.restaurants.phone_numbers
                    )
end

# Adding Restaurants to a List
a_list << amirsowl

# Update Listed Restaurant's columns
a_list.list_restaurant.last.update(cuisine: "Southern Comfort Food", fav_dish: "Fried Green Tomatoes", restaurant_type: "SowlFood", location: "NYC", tried: true)

# Add an Experience to a Listed Restaurant
# a_list.list_restaurants.last.list_experiences
