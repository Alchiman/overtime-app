# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "ALireza", last_name: "Mansoor")

puts "1 user created"

100.times do |post|
  Post.create!(date: Date.today, rational: "#{post} rational content",  user_id: @user.id)
end

puts "100 posts have been created"