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

10.times do |c|
  Customer.create(first_name: "Customer", last_name: "#{c}", email: "customer#{c}@gmail.com", phone_number: rand(1000000000..9999999999))
end

10.times do |p|
  Commodity.create(title: "Commodity", description: "It is the description of #{p} commodity", price: rand(0..10000), is_active: rand(0..1), status: rand(0..2))
end

30.times do |o|
  Order.create(quantity: rand(1..30), status: rand(0..1), commodity_id: Commodity.ids.sample, customer_id: Customer.ids.sample)
end
