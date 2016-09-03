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
                    address: "14 Amir st., Amir, NY",
                    locality: "Chelsea",
                    city: "New York",
                    zipcode: "10023",
                    average_cost_for_two: "40",
                    featured_img: "./image/ChickenPotPie.png",
                    menu_url: "www.Amirsowl.com/menu",
                    has_online_delivery: "no",
                    cuisines: "cheap",
                    restaurant_id: "123"
                    )

# Seed featured restaurants
require_relative '../lib/api.rb'
include Zomato

featured_restaurants = Zomato::API.new(280, 'city', '1')
featured_restaurants.request_data

featured_restaurants.response["restaurants"].map do |restaurant|
    rest = restaurant["restaurant"]
    Restaurant.create!( name: rest["name"],
                    restaurant_url: rest["url"],
                    address: rest["location"]["address"],
                    locality: rest["location"]["locality"],
                    city: rest["location"]["city"],
                    zipcode: rest["location"]["zipcode"],
                    average_cost_for_two: rest["average_cost_for_two"],
                    featured_img: rest["featured_image"],
                    menu_url: rest["menu_url"],
                    has_online_delivery: rest["has_online_delivery"],
                    cuisines: rest["cuisines"],
                    restaurant_id: rest["id"]
                    )
end

# Adding Restaurants to a List
a_list << amirsowl

# Update Listed Restaurant's columns
a_list.list_restaurant.last.update(cuisine: "Southern Comfort Food", fav_dish: "Fried Green Tomatoes", restaurant_type: "SowlFood", location: "NYC", tried: true)

# Add an Experience to a Listed Restaurant
# a_list.list_restaurants.last.list_experiences
