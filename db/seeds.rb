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

30.times do |em|
  Employee.find_or_create_by(first_name: "Employee", last_name: "#{em}", email: "employee#{em}@gmail.com", age: rand(18..30), no_of_order: rand(0..20), full_time_available: rand(0..1), salary: rand(20..100)*1000)
end
