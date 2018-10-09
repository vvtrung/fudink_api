# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!(name: "Admin")
Role.create!(name: "Shipper")
Role.create!(name: "Customer")

Category.create!(name: "Milk Tea")
Category.create!(name: "An Vat")

User.create!(name: "vo van trung", email: "vts@gmail.com", password: "123123123",
  phone: "0973857454", address: "k34/54 auco", role_id: 3)

20.times.each do |i|
  Store.create!(name: Faker::Name.name, email: "Store#{i}@gmail.com", user_id: 1)
end
