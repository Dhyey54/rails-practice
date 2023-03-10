class AddInitialAuthors < ActiveRecord::Migration[7.0]
  def up
    author_firstname = ["Dhyey", "Krutik", "Aditya","William","J.K."]
    author_lastname = ["Sapara", "Patel", "Kansara","Shakesphere","Rowling"]
    author_dob = ["15-12-2001","6-4-1992","22-09-1980","23-04-1994","23-06-1965"]
    author_email = ["dhyeysapara@gmail.com", "krutik.patel2@hotmail.com", "aditya_kansara4@yahoo.com","williamsphere@hotmail.com","rowling62@gmail.com"]
    5.times do |i|
      Author.create(first_name: "#{author_firstname[i]}", last_name: "#{author_lastname[i]}", date_of_birth: Date.parse("#{author_dob[i]}"), email: "#{author_email[i]}")
    end
  end

  def down
    Author.delete_all
  end
end
