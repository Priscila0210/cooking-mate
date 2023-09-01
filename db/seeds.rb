# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning up"
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
User.create!(nickname: "Marcia", email: "marcia@test.com", password: "123456", address: "Barcelona", age: 35, description: Faker::Lorem.paragraph_by_chars(number: 56, supplemental: false), interested_in: "only friends", cooking_level: "beginner", availability: ["weekdays"])
User.create!(nickname: "Gonzalo", email: "gonzalo@test.com", password: "123456", address: "Roma", age: 40, description: Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false), interested_in: "open to anything", cooking_level: "some experience", availability: ["weekdays", "weekend"])

puts "Creating recipes"

Recipe.create!(title: "Gaspacho", description: "In the dog days of summer, we're grateful for this easy gazpacho recipe, which comes together quickly in a blender, no cooking necessary.", length: 1, level_of_difficulty: "easy", cuisine: Cuisine.first, user: User.first)
Recipe.create!(title: "Caccio e pepe", description: "Mama's recipe which requires only 4 ingredients and takes 15 minutes to make! A perfect weeknight pasta dish thats's super indulgent.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.first, user: User.last)
Recipe.create!(title: "Burrito", description: "Everyday Beef Burrito recipe, stuffed with a simpler, super tasty seasoned beef filling, rice and other fillings of choice.", length: 3, level_of_difficulty: "medium", cuisine: Cuisine.first, user: User.last)
Recipe.create!(title: "Bacalau", description: "Portuguese style", length: 7, level_of_difficulty: "hard", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Coxinhas", description: "Chicken croquettes shaped into a chicken drumstick and fried until crispy and golden brown. It's popular Brazilian street food!", length: 4, level_of_difficulty: "medium", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Paella", description: "The taste of Spain", length: 7, level_of_difficulty: "hard", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Schnitzel", description: "Authentic German Schnitzel just the way your favorite German restaurants make it! A fool-proof recipe for absolute PERFECTION!", length: 4, level_of_difficulty: "medium", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Crème brulée", description: "The sweet of Paris. Et voilà!", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Shrimp and Asparagus Pasta", description: "This classic spring pasta dish combines the fresh, seasonal flavor of asparagus with sweet, tender shrimp.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Banana bread", description: "This banana bread recipe creates the most delicious, moist loaf with loads of banana flavor. Why compromise the banana flavor? Friends and family love my recipe and say it's by far the best! It tastes wonderful toasted. Enjoy!", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Stuffed Mushrooms", description: "The most irresistible holiday appetizer that just might disappear before your main course appears. This easy appetizer adds a bit of fancy flare to your spread, whether you're serving them at your Christmas dinner or New Year's celebration.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Thai-Style Chicken Curry", description: "This saucy curry comes together in a snap with a store-bought rotisserie chicken, frozen vegetables, canned coconut milk and jarred curry paste. We wouldn’t call this an authentic Thai curry, but it delivers hearty comfort and bold flavors in a weeknight- and pantry-friendly package.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Barbecue Chicken Quesadillas", description: "These quesadillas are easy, cheesy and full of flavor. Pickled jalapeños add a pleasant kick of heat, but you can omit them if you are spice-averse. Using a store-bought rotisserie chicken saves you the trouble of cooking the meat yourself. If you want to cut down on cooking time, use a griddle or multiple skillets so you can make more than one quesadilla at a time. If using a rotisserie or roasted chicken, be sure to taste the meat on its own and adjust the salt level in the recipe as needed.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Hadji Bada (Iraqi Almond Cookies)", description: "These flourless almond cookies are “sort of like French macarons,” explains cookbook author Jake Cohen, but “without the meringue, and much easier to throw together any time you want.” He learned the recipe from his great-aunt-in-law, Doris, who handed him a copy at his family's first blended Passover seder and notes that “it's the gift that keeps on giving.”", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Best Mac and Cheese", description: "This homemade mac and cheese is our Platonic ideal: It is deeply cheesy and creamy and has a crunchy crust. Plus, it doubles easily for a crowd.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Pasta e Fagiolini", description: "This tomatoey vegetarian pasta from Southern Italy makes the most of green beans.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Chocolate Pie With Press-In Crust", description: "Destined to be your go-to chocolate pie recipe for any and all occasions.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Cheesy Pork and Tomatillo Skillet", description: "Teamed up with chips, this dip is the most popular snack in town. Or be like us and call it dinner.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Lemon Meringue Pie", description: "A sky-high pie with sharp lemon filling, sweet-and-salty meringue, and a shatteringly crisp crust.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
Recipe.create!(title: "Hot Spiced Apple Cider", description: "This easy recipe for homemade apple cider doubles as aromatherapy.", length: 2, level_of_difficulty: "easy", cuisine: Cuisine.last, user: User.first)
