# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create groups
first_group = Group.create(name: "Food", icon: "https://img.uxwing.com/wp-content/themes/uxwing/download/food-drinks-cooking/meal-food-icon.png", author_id: 1)
second_group = Group.create(name: "Transport", icon: "https://img.uxwing.com/wp-content/themes/uxwing/download/food-drinks-cooking/meal-food-icon.png", author_id: 1)
third_group = Group.create(name: "Entertainment", icon: "https://img.uxwing.com/wp-content/themes/uxwing/download/food-drinks-cooking/meal-food-icon.png", author_id: 1)
first_operation = Operation.create(name: "pizza", amount: 12, author_id: 1)
second_operation = Operation.create(name: "cake", amount: 20, author_id: 1)
third_operation = Operation.create(name: "taxi", amount: 10, author_id: 1)
fourth_operation = Operation.create(name: "bus", amount: 5, author_id: 1)
fifth_operation = Operation.create(name: "cinema", amount: 15, author_id: 1)
sixth_operation = Operation.create(name: "theatre", amount: 30, author_id: 1)
first_group_operation = GroupOperation.create(group_id: 1, operation_id: 1)
second_group_operation = GroupOperation.create(group_id: 1, operation_id: 2)
third_group_operation = GroupOperation.create(group_id: 2, operation_id: 3)
fourth_group_operation = GroupOperation.create(group_id: 2, operation_id: 4)
fifth_group_operation = GroupOperation.create(group_id: 3, operation_id: 5)
sixth_group_operation = GroupOperation.create(group_id: 3, operation_id: 6)

