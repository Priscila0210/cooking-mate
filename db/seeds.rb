# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Cuisine.destroy_all
User.destroy_all
Diet.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

Cuisine.create!(name: "Spanish")
Cuisine.create!(name: "Italian")
Cuisine.create!(name: "French")
Cuisine.create!(name: "Brazilian")

Diet.create!(name: "Vegetarian")
Diet.create!(name: "Vegan")
Diet.create!(name: "Glutenfree")

Ingredient.create!(name: "Zucchini")
Ingredient.create!(name: "Mushroom")
Ingredient.create!(name: "Pumpkin")


User.create!(nickname: "Marcia", email: "marcia@test.com", password: "123456", address: "Barcelona", age: 35, description: Faker::Lorem.paragraph_by_chars(number: 56, supplemental: false), interested_in: "only friends", cooking_level: "beginner", availability: ["weekdays"])
User.create!(nickname: "Gonzalo", email: "gonzalo@test.com", password: "123456", address: "Roma", age: 40, description: Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false), interested_in: "open to anything", cooking_level: "some experience", availability: ["weekdays", "weekend"])


Recipe.create!(title: "Gaspacho", description: "Lorem", length: 1, level_of_difficulty: "easy", cuisine_id: Cuisine.first, user_id: User.first)
Recipe.create!(title: "Caccio e pepe", description: "Ipsum", length: 2, level_of_difficulty: "easy", cuisine_id: rand(0..4), user_id: User.last)
Recipe.create!(title: "Burrito", description: "Description goes here", length: 3, level_of_difficulty: "medium", cuisine_id: Cuisine.first, user_id: User.last)

Recipe.create!(title: "Bacalau", description: "Best of Brazil", length: 7, level_of_difficulty: "hard", cuisine_id: Cuisine.last, user_id: User.first)
