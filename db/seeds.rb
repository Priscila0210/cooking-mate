# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "Cleaning up"
Message.destroy_all
Chatroom.destroy_all
UsersCuisine.destroy_all
RecipesDiet.destroy_all
UsersDiet.destroy_all
Booking.destroy_all
Recipe.destroy_all
Cuisine.destroy_all
Diet.destroy_all
Ingredient.destroy_all

User.destroy_all


puts "Creating cuisines"
Cuisine.create!(name: "Spanish")
Cuisine.create!(name: "Italian")
Cuisine.create!(name: "French")
Cuisine.create!(name: "Brazilian")
Cuisine.create!(name: "Japanese")
Cuisine.create!(name: "Chinese")
Cuisine.create!(name: "Greek")
Cuisine.create!(name: "Indian")
Cuisine.create!(name: "German")
Cuisine.create!(name: "Mexican")
Cuisine.create!(name: "American")

puts "Creating diets"
Diet.create!(name: "Vegetarian")
Diet.create!(name: "Vegan")
Diet.create!(name: "Glutenfree")
Diet.create!(name: "Low carb")
Diet.create!(name: "Sugarfree")
Diet.create!(name: "Dessert")

puts "Creating ingredients"
Ingredient.create!(name: "Beef")
Ingredient.create!(name: "Lamb")
Ingredient.create!(name: "Veal")
Ingredient.create!(name: "Pork")
Ingredient.create!(name: "Goose")
Ingredient.create!(name: "Chicken")
Ingredient.create!(name: "Goat")
Ingredient.create!(name: "Turkey")

Ingredient.create!(name: "Fish")
Ingredient.create!(name: "Prawns")
Ingredient.create!(name: "Crab")
Ingredient.create!(name: "Lobster")
Ingredient.create!(name: "Shrimps")
Ingredient.create!(name: "Oyster")
Ingredient.create!(name: "Snails")

Ingredient.create!(name: "Zucchini")
Ingredient.create!(name: "Mushroom")
Ingredient.create!(name: "Pumpkin")
Ingredient.create!(name: "Eggs")
Ingredient.create!(name: "Salt")
Ingredient.create!(name: "Flour")
Ingredient.create!(name: "Garlic")
Ingredient.create!(name: "Onion")
Ingredient.create!(name: "Sweet Potato")
Ingredient.create!(name: "Cumcumber")
Ingredient.create!(name: "Spinach")
Ingredient.create!(name: "Lettuce")
Ingredient.create!(name: "Potato")
Ingredient.create!(name: "Cabbage")
Ingredient.create!(name: "Cauliflower")
Ingredient.create!(name: "Asparagus")
Ingredient.create!(name: "Celery")
Ingredient.create!(name: "Eggplant")
Ingredient.create!(name: "Carrot")
Ingredient.create!(name: "Radish")
Ingredient.create!(name: "Artichoke")
Ingredient.create!(name: "Eggs")
Ingredient.create!(name: "Salt")
Ingredient.create!(name: "Flour")
Ingredient.create!(name: "Milk")

puts "Creating users"

avatar1= URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/c_thumb,w_200,g_face/v1693573270/production/Marcia.jpg")
user1 = User.new(nickname: "Marcia", email: "marcia@test.com", password: "123456", address: "Barcelona", age: 35, description: "First I want to learn new recipes but then who knows...", interested_in: "only friends", cooking_level: "beginner", availability: ["weekdays"])
user1.avatar.attach(io: avatar1, filename: "Marcia.jpg", content_type: "image/jpg")
user1.save


avatar2= URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/c_thumb,w_200,g_face/v1693831045/production/Gonzalo.jpg")
user2 = User.create!(nickname: "Gonzalo", email: "gonzalo@test.com", password: "123456", address: "Roma", age: 40, description: "I'm a latin guy, hoping to find  the love of my life in the kitchen", interested_in: "open to anything", cooking_level: "some experience", availability: ["weekdays", "weekend"])
user2.avatar.attach(io: avatar2, filename: "Gonzalo.jpg", content_type: "image/jpg")
user2.save

avatar3= URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/c_thumb,w_200,g_face/v1693833943/production/Marcel.png")
user3 = User.create!(nickname: "Marcel", email: "marcel@test.com", password: "123456", address: "Berlin", age: 20, description: "I'm learning English, coding and now I want to learn how to cook Burritos", interested_in: "open to anything", cooking_level: "some experience", availability: ["weekend"])
user3.avatar.attach(io: avatar3, filename: "Marcel.png", content_type: "image/png")
user3.save

avatar4= URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/c_thumb,w_200,g_face/v1693831601/production/Eduardo.jpg")
user4 = User.create!(nickname: "Eduardo", email: "eduardo@test.com", password: "123456", address: "Rio de Janeiro", age: 60, description: "I'm a lazy guy, tired of ordering food", interested_in: "only friends", cooking_level: "advanced", availability: ["weekdays", "weekend"])
user4.avatar.attach(io: avatar4, filename: "Eduardo.jpg", content_type: "image/jpg")
user4.save

avatar5= URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/c_thumb,w_200,g_face/v1693834963/production/Priscila.png")
user5 = User.create!(nickname: "Priscila", email: "priscila@test.com", password: "123456", address: "Paris", age: 29, description: "I'm down to earth woman, who loves to explore the culinary world", interested_in: "open to anything", cooking_level: "beginner", availability: ["weekdays", "weekend"])
user5.avatar.attach(io: avatar5, filename: "Priscila.png", content_type: "image/png")
user5.save


puts "Creating recipes"


file1 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566686/production/Gaspacho.jpg")
recipe1 = Recipe.new(title: "Gaspacho", description: "In the dog days of summer, we're grateful for this easy gazpacho recipe, which comes together quickly in a blender, no cooking necessary.", length: 1, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Spanish"), user: User.find_by(nickname: "Priscila"))
recipe1.photo.attach(io: file1, filename: "Gaspacho.jpg", content_type: "image/jpg")
recipe1.save


file2 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693419726/production/Caccio%20e%20pepe.jpg")
recipe2 = Recipe.new(title: "Caccio e pepe", description: "Mama's recipe which requires only 4 ingredients and takes 15 minutes to make! A perfect weeknight pasta dish thats's super indulgent.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Italian"), user: User.find_by(nickname: "Priscila"))
recipe2.photo.attach(io: file2, filename: "Caccioepepe.jpg", content_type: "image/jpg")
recipe2.save

file3 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693419191/production/Burrito.jpg")
recipe3 = Recipe.new(title: "Burrito", description: "Everyday Beef Burrito recipe, stuffed with a simpler, super tasty seasoned beef filling, rice and other fillings of choice.", length: 3, level_of_difficulty: "medium", cuisine: Cuisine.find_by(name: "Mexican"), user: User.find_by(nickname: "Priscila"))
recipe3.photo.attach(io: file3, filename: "Burrito.jpg", content_type: "image/jpg")
recipe3.save

file4 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566755/production/Bacalau.jpg")
recipe4 = Recipe.new(title: "Bacalau", description: "Portuguese style", length: 7, level_of_difficulty: "hard", cuisine: Cuisine.find_by(name: "Brazilian"), user: User.find_by(nickname: "Priscila"))
recipe4.photo.attach(io: file4, filename: "Bacalau.jpg", content_type: "image/jpg")
recipe4.save

file5 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693570613/production/Coxinhas.jpg")
recipe5 = Recipe.new(title: "Coxinhas", description: "Chicken croquettes shaped into a chicken drumstick and fried until crispy and golden brown. It's popular Brazilian street food!", length: 4, level_of_difficulty: "medium", cuisine: Cuisine.find_by(name: "Brazilian"), user: User.find_by(nickname: "Eduardo"))
recipe5.photo.attach(io: file5, filename: "Coxinhas.jpg", content_type: "image/jpg")
recipe5.save

file6 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693502667/production/Paella.jpg")
recipe6 = Recipe.new(title: "Paella", description: "The taste of Spain", length: 7, level_of_difficulty: "hard", cuisine: Cuisine.find_by(name: "Spanish"), user: User.find_by(nickname: "Eduardo"))
recipe6.photo.attach(io: file6, filename: "Paella.jpg", content_type: "image/jpg")
recipe6.save

file7 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693502696/production/Schnitzel.jpg")
recipe7 = Recipe.new(title: "Schnitzel", description: "Authentic German Schnitzel just the way your favorite German restaurants make it! A fool-proof recipe for absolute PERFECTION!", length: 4, level_of_difficulty: "medium", cuisine: Cuisine.find_by(name: "German"), user: User.find_by(nickname: "Eduardo"))
recipe7.photo.attach(io: file7, filename: "Schnitzel.jpg", content_type: "image/jpg")
recipe7.save

file8 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693502731/production/Creme%20brulee.jpg")
recipe8 = Recipe.new(title: "Crème brulée", description: "The sweet of Paris. Et voilà!", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "French"), user: User.find_by(nickname: "Eduardo"))
recipe8.photo.attach(io: file8, filename: "Cremebrulee.jpg", content_type: "image/jpg")
recipe8.save

file9 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693568596/production/Shrimp%20and%20Asparagus%20Pasta.jpg")
recipe9 = Recipe.new(title: "Shrimp and Asparagus Pasta", description: "This classic spring pasta dish combines the fresh, seasonal flavor of asparagus with sweet, tender shrimp.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Greek"), user: User.find_by(nickname: "Marcel"))
recipe9.photo.attach(io: file9, filename: "Shrimpandasparaguspasta.jpg", content_type: "image/jpg")
recipe9.save

file10 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566230/production/Banana%20bread.jpg")
recipe10 = Recipe.new(title: "Banana bread", description: "This banana bread recipe creates the most delicious, moist loaf with loads of banana flavor. Why compromise the banana flavor? Friends and family love my recipe and say it's by far the best! It tastes wonderful toasted. Enjoy!", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "American"), user: User.find_by(nickname: "Marcel"))
recipe10.photo.attach(io: file10, filename: "Bananabread.jpg", content_type: "image/jpg")
recipe10.save

file11 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566248/production/Stuffed%20Mushrooms.jpg")
recipe11 = Recipe.new(title: "Stuffed Mushrooms", description: "The most irresistible holiday appetizer that just might disappear before your main course appears. This easy appetizer adds a bit of fancy flare to your spread, whether you're serving them at your Christmas dinner or New Year's celebration.", length: 2, level_of_difficulty: "easy",  cuisine: Cuisine.find_by(name: "Mexican"), user: User.find_by(nickname: "Marcel"))
recipe11.photo.attach(io: file11, filename: "Stuffedmushrooms.jpg", content_type: "image/jpg")
recipe11.save

file12 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566419/production/Thai-Style%20Chicken%20Curry.jpg")
recipe12 = Recipe.new(title: "Thai-Style Chicken Curry", description: "This saucy curry comes together in a snap with a store-bought rotisserie chicken, frozen vegetables, canned coconut milk and jarred curry paste. We wouldn’t call this an authentic Thai curry, but it delivers hearty comfort and bold flavors in a weeknight- and pantry-friendly package.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Indian"), user: User.find_by(nickname: "Marcel"))
recipe12.photo.attach(io: file12, filename: "Thai-stylechickencurry.jpg", content_type: "image/jpg")
recipe12.save

file13 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566644/production/Barbecue%20Chicken%20Quesadillas.jpg")
recipe13 = Recipe.new(title: "Barbecue Chicken Quesadillas", description: "These quesadillas are easy, cheesy and full of flavor. Pickled jalapeños add a pleasant kick of heat, but you can omit them if you are spice-averse. Using a store-bought rotisserie chicken saves you the trouble of cooking the meat yourself. If you want to cut down on cooking time, use a griddle or multiple skillets so you can make more than one quesadilla at a time. If using a rotisserie or roasted chicken, be sure to taste the meat on its own and adjust the salt level in the recipe as needed.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Mexican"), user: User.find_by(nickname: "Gonzalo"))
recipe13.photo.attach(io: file13, filename: "Barbecuechickenquesadillas.jpg", content_type: "image/jpg")
recipe13.save

file14 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693569869/production/Hadji%20Bada%20%28Iraqi%20Almond%20Cookies%29.jpg")
recipe14 = Recipe.new(title: "Hadji Bada (Iraqi Almond Cookies)", description: "These flourless almond cookies are “sort of like French macarons,” explains cookbook author Jake Cohen, but “without the meringue, and much easier to throw together any time you want.” He learned the recipe from his great-aunt-in-law, Doris, who handed him a copy at his family's first blended Passover seder and notes that “it's the gift that keeps on giving.”", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "American"), user: User.find_by(nickname: "Gonzalo"))
recipe14.photo.attach(io: file14, filename: "Hadjibada.jpg", content_type: "image/jpg")
recipe14.save

file15 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693569674/production/Best%20Mac%20and%20Cheese.jpg")
recipe15 = Recipe.new(title: "Best Mac and Cheese", description: "This homemade mac and cheese is our Platonic ideal: It is deeply cheesy and creamy and has a crunchy crust. Plus, it doubles easily for a crowd.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "American"), user: User.find_by(nickname: "Gonzalo"))
recipe15.photo.attach(io: file15, filename: "Bestmacandcheese.jpg", content_type: "image/jpg")
recipe15.save

file16 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566324/production/Pasta%20e%20Fagiolini.jpg")
recipe16 = Recipe.new(title: "Pasta e Fagiolini", description: "This tomatoey vegetarian pasta from Southern Italy makes the most of green beans.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Italian"), user: User.find_by(nickname: "Gonzalo"))
recipe16.photo.attach(io: file16, filename: "pastaefagiolini.jpg", content_type: "image/jpg")
recipe16.save

file17 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566363/production/Chocolate%20Pie%20With%20Press-In%20Crust.jpg")
recipe17 = Recipe.new(title: "Chocolate Pie With Press-In Crust", description: "Destined to be your go-to chocolate pie recipe for any and all occasions.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "American"), user: User.find_by(nickname: "Marcia"))
recipe17.photo.attach(io: file17, filename: "Chocolatepiewithpress-incrust.jpg", content_type: "image/jpg")
recipe17.save

file18 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566442/production/Cheesy%20Pork%20and%20Tomatillo%20Skillet.jpg")
recipe18 = Recipe.new(title: "Cheesy Pork and Tomatillo Skillet", description: "Teamed up with chips, this dip is the most popular snack in town. Or be like us and call it dinner.", length: 2, level_of_difficulty: "easy",  cuisine: Cuisine.find_by(name: "Mexican"), user: User.find_by(nickname: "Marcia"))
recipe18.photo.attach(io: file18, filename: "Cheesyporkandtomatilloskillet.jpg", content_type: "image/jpg")
recipe18.save

file19 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693566518/production/Lemon%20Meringue%20Pie.jpg")
recipe19 = Recipe.new(title: "Lemon Meringue Pie", description: "A sky-high pie with sharp lemon filling, sweet-and-salty meringue, and a shatteringly crisp crust.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "French"), user: User.find_by(nickname: "Marcia"))
recipe19.photo.attach(io: file19, filename: "Lemonmeringuepie.jpg", content_type: "image/jpg")
recipe19.save

file20 = URI.open("https://res.cloudinary.com/dzltofqgu/image/upload/v1693565853/production/Hot%20Spiced%20Apple%20Cider.jpg")
recipe20 = Recipe.new(title: "Hot Spiced Apple Cider", description: "This easy recipe for homemade apple cider doubles as aromatherapy.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.find_by(name: "Chinese"), user: User.find_by(nickname: "Marcia"))
recipe20.photo.attach(io: file20, filename: "Hotspicedapplecider.jpg", content_type: "image/jpg")
recipe20.save
