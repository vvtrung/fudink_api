# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Action.create!(name: "read")
Action.create!(name: "create")
Action.create!(name: "update")
Action.create!(name: "delete")

Role.create!(name: "Admin")
Role.create!(name: "Store Owner")
Role.create!(name: "Shipper")
Role.create!(name: "Customer")

admin_roles = ["Role", "Action", "Permission", "Image", "User", "Store", "Shipper",
  "Category", "Product", "Size", "Order", "DetailOrder", "ShipperOrder", "Rate", "AuthToken", "Cart"]
admin_roles.each do |sub_class|
  4.times.each do |i|
    Permission.create!(role_id: 1, action_id: i + 1, sub_class: sub_class)
  end
end

customer_read = ["User", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart"]
customer_create = ["Store", "Rate", "Order", "Cart"]
customer_update = ["Cart", "User"]
customer_delete = ["Cart"]

customer_read.each do |sub_class|
  Permission.create!(role_id: 4, action_id: 1, sub_class: sub_class)
end
customer_create.each do |sub_class|
  Permission.create!(role_id: 4, action_id: 2, sub_class: sub_class)
end
customer_update.each do |sub_class|
  Permission.create!(role_id: 4, action_id: 3, sub_class: sub_class)
end
customer_delete.each do |sub_class|
  Permission.create!(role_id: 4, action_id: 4, sub_class: sub_class)
end

store_owner_read = ["User", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart", "DetailOrder"]
store_owner_create = ["Store", "Rate", "Order", "Cart", "Product", "Image", "Size"]
store_owner_update = ["Store", "Product", "Size", "Image", "Cart", "Order", "User"]
store_owner_delete = ["Store", "Product", "Size", "Image", "Cart"]

store_owner_read.each do |sub_class|
  Permission.create!(role_id: 2, action_id: 1, sub_class: sub_class)
end
store_owner_create.each do |sub_class|
  Permission.create!(role_id: 2, action_id: 2, sub_class: sub_class)
end
store_owner_update.each do |sub_class|
  Permission.create!(role_id: 2, action_id: 3, sub_class: sub_class)
end
store_owner_delete.each do |sub_class|
  Permission.create!(role_id: 2, action_id: 4, sub_class: sub_class)
end

shipper_read = ["User", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart", "ShipperOrder", "DetailOrder", "Device"]
shipper_create = ["Cart", "Order", "Rate", "Device"]
shipper_update = ["Cart", "User", "Shipper", "ShipperOrder"]
shipper_delete = ["Cart", "Device"]

shipper_read.each do |sub_class|
  Permission.create!(role_id: 3, action_id: 1, sub_class: sub_class)
end
shipper_create.each do |sub_class|
  Permission.create!(role_id: 3, action_id: 2, sub_class: sub_class)
end
shipper_update.each do |sub_class|
  Permission.create!(role_id: 3, action_id: 3, sub_class: sub_class)
end
shipper_delete.each do |sub_class|
  Permission.create!(role_id: 3, action_id: 4, sub_class: sub_class)
end

Category.create!(name: "Milk Tea")
Category.create!(name: "An Vat")

User.create!(name: Faker::Name.name, email: "vts@gmail.com", password: "123123123",
  phone: "0973857454", address: Faker::Address.full_address, role_id: 2)

User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: "123123123",
  phone: "0973857454", address: Faker::Address.full_address, role_id: 4)

User.create!(name: Faker::Name.name, email: "vinhbb@gmail.com", password: "123123123",
  phone: "0973857454", address: Faker::Address.full_address, role_id: 3)

User.create!(name: Faker::Name.name, email: "kiki@gmail.com", password: "123123123",
  phone: "0973857454", address: Faker::Address.full_address, role_id: 1)

5.times.each do |i|
  Store.create!(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    user_id: 1,
    phone: "0973857454",
    address: Faker::Address.full_address,
    open_at: "08:00",
    close_at: "21:00",
    status: "accepted"
  )
end

Store.all.each do |store|
  Category.all.each do |category|
    20.times.each do |i|
      Product.create!(name: Faker::Name.name, category_id: category.id, store_id: store.id,
        product_type: "food", description: Faker::Lorem.sentence(10))
      Product.create!(name: Faker::Name.name, category_id: category.id, store_id: store.id,
        product_type: "drink", description: Faker::Lorem.sentence(10))
    end
  end
end

Product.all.each do |product|
  Size.create!(product_id: product.id, size: "M", price: 10000)
end

Order.create!(
  user_id: 2,
  store_id: 1,
  address: Faker::Address.full_address,
  phone: "0973857454",
  ship_cost: 10000,
  total: 10000,
  status: "pending"
)

DetailOrder.create!(
  order_id: 1,
  product_id: 1,
  size_id: 1,
  quantity: 1,
  price: 10000
)
