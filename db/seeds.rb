# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
    username: 'admin',
    email: 'admin@example.com',
    password: '2wsx@WSX',
    password_confirmation: '2wsx@WSX'
)

categories = %w(home food food\ out car hobby)
categories.each do |c|
  Category.create(name: c, user: admin)
end