class AddInitialBooks < ActiveRecord::Migration[7.0]
  def up
    count = Author.all.count
    8.times do |i|
      Book.create(name: "Book ##{i+1}", price: rand(100..1000), author_id: rand(1..count))
    end
  end

  def down
    Book.delete_all
  end
end
