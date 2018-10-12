# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!(name: "Admin")
Role.create!(name: "Store Owner")
Role.create!(name: "Shipper")
Role.create!(name: "Customer")

Category.create!(name: "Milk Tea")
Category.create!(name: "An Vat")

User.create!(name: Faker::Name.name, email: "vts@gmail.com", password: "123123123",
  phone: "0973857454", address: Faker::Address.street_address, role_id: 2)

User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: "123123123",
  phone: "0973857454", address: Faker::Address.street_address, role_id: 4)

10.times.each do |i|
  Store.create!(name: Faker::Name.name, email: Faker::Internet.free_email, user_id: 1, phone: "0973857454", address: Faker::Address.street_address, status: "accepted")
end

Store.all.each do |store|
  Category.all.each do |category|
    20.times.each do |i|
      Product.create!(name: Faker::Name.name, category_id: category.id, store_id: store.id,
        product_type: "food")
      Product.create!(name: Faker::Name.name, category_id: category.id, store_id: store.id,
        product_type: "drink")
    end
  end
end

Product.all.each do |product|
  Size.create!(product_id: product.id, size: "M", price: 10000)
end
