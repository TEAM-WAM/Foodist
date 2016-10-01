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

# Create 30 random users
30.times do
     User.create!(username: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password", email: Faker::Internet.email)
end

# Create 1 list per Team Wam user
a_list = amir.lists.create!(title: "Amir's Soul Food list")
m_list = myra.lists.create!(title: "Cool SF Spots")
w_list = walter.lists.create!(title: "Walter's Tex-Mex list")

# Create 6 additional lists for Amir
list_titles = ["Places with the Spiciest Food", "My Favorite Restaurants Ever", "Places to take Mom & Pop", "Experimental Foods", "Hawaiian Spots", "Pet friendly restaurants!"]
list_titles.map do |list|
     amir.lists.create!(title: list)
end

# Construct 1 profile per user
# users = User.all
# users.map do |user|
#      profile = user.build_profile
#      profile.save
# end


# Create 1 group, creator Amir
spicytacos = amir.created_groups.create!(name: "The Spicy Tacos", description: "We love spicy tacos! They're the best!")
spicytacos.members.push(myra, walter)

# Create 1 group, creator Myra
bobafans = myra.created_groups.create!(name: "Boba Fans", description: "If you love tapioca bubble drinks, this is the group for you!")
bobafans.members.push(amir, walter)

# Create Amir's specialty restaurant
amirsowl = Restaurant.create!( name: "Amir's SowlFood",
                    restaurant_url: "https://www.amirsowl.com",
                    address: "14 Amir st., Amir, NY",
                    locality: "Chelsea",
                    city: "New York",
                    zipcode: "10023",
                    average_cost_for_two: "40",
                    featured_img: "./image/ChickenPotPie.png",
                    menu_url: "https://www.Amirsowl.com/menu",
                    has_online_delivery: "no",
                    cuisines: "cheap",
                    restaurant_id: "123"
                    )

# Seed featured restaurants
featured_restaurants = Zomato::API.new
featured_restaurants.request_data(280, 'city', '1')

featured_restaurants.response_data["restaurants"].map do |restaurant|
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
a_list.restaurants << amirsowl

# Update Listed Restaurant's columns
a_list.list_restaurants.first.update(cuisine: "Southern Comfort Food", fav_dish: "Fried Green Tomatoes", restaurant_type: "SowlFood", location: "NYC", tried: true)

# Add an Experience to a Listed Restaurant
a_list.list_restaurants.first.list_experiences.create!(date_of_experience: "01/03/2015",
                                                       main_dish: "Chicken Pot Pie",
                                                       price: 24,
                                                       party_size: 2,
                                                       time_seated: 45,
                                                       time_waiting: 30,
                                                       notes: "They don't let you take away leftovers so order just the right amount next time. Also, better to come a little early to avoid the wait time."
                                                       )

# Add a custom field to Amir's List
a_list.list_restaurants.first.custom_fields.create!( field_name: "Spice Meter")

# Add a custom value under the custom field in Amir's List
a_list.list_restaurants.first.list_experiences.first.custom_values.create!( field_value: "8/10", custom_field_id: CustomField.last.id)

# Leave a comment on Amir's List
a_list.comments.create!( body: "This is such a cool list, Amir! I love it. I'm going to share it with every single person I know. :)", user_id: myra.id)

# 2 Votes on Amir's List
a_list.votes.create!(up: true, user_id: myra.id)
a_list.votes.create!(up: true, user_id: walter.id)

# 2 Votes on Amir's Restaurant
amirsowl.votes.create!(up: true, user_id: myra.id)
amirsowl.votes.create!(up: true, user_id: walter.id)

# 1000 Votes randomly distributed over the all Restaurants, Lists, and Comments.
1000.times do
     types = [Restaurant.all, List.all, Comment.all].sample
     Vote.create!( up: true,
                   user_id: User.all.sample.id,
                   voteable_type: types.first.class.name,
                   voteable_id: types.sample.id
                   )
end
