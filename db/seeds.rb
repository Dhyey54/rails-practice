# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  count = Author.all.count
  Book.find_or_create_by(name: "Book ##{rand(1000)}", price: rand(100..1000), author_id: rand(1..count))
end

["Music", "Visual Arts", "Film", "Fashion"].each do |cat|
  Category.find_or_create_by(category_name: cat)
  
10.times do |c|
  Customer.create(first_name: "Customer", last_name: "#{c}", email: "customer#{c}@gmail.com", phone_number: rand(1000000000..9999999999))
end

10.times do |p|
  Commodity.create(title: "Commodity #{p}", description: "It is the description of #{p} commodity", price: rand(500..10_000).ceil(-3),capacity: rand(1..50), is_active: rand(0..1), status: rand(0..2))
end

30.times do
  Order.create(quantity: rand(1..30), status: rand(0..1), commodity_id: Commodity.ids.sample, customer_id: Customer.ids.sample)
end

30.times do |em|
  Employee.find_or_create_by(first_name: "Employee", last_name: "#{em}", email: "employee#{em}@gmail.com", age: rand(18..30), no_of_order: rand(0..20), full_time_available: rand(0..1), salary: rand(20..100)*1000)
end
