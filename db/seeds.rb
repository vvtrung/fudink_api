# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Action.create!(name: "read")
# Action.create!(name: "create")
# Action.create!(name: "update")
# Action.create!(name: "destroy")

# Role.create!(name: "Admin")
# Role.create!(name: "Store Owner")
# Role.create!(name: "Shipper")
# Role.create!(name: "Customer")

# admin_roles = ["Role", "Action", "Permission", "Image", "User", "Store", "Shipper",
#   "Category", "Product", "Size", "Order", "DetailOrder", "ShipperOrder", "Rate", "AuthToken", "Cart"]
# admin_roles.each do |sub_class|
#   4.times.each do |i|
#     Permission.create!(role_id: 1, action_id: i + 1, sub_class: sub_class)
#   end
# end

# customer_read = ["User", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart"]
# customer_create = ["Store", "Rate", "Order", "Cart"]
# customer_update = ["Cart", "User"]
# customer_delete = ["Cart"]

# customer_read.each do |sub_class|
#   Permission.create!(role_id: 4, action_id: 1, sub_class: sub_class)
# end
# customer_create.each do |sub_class|
#   Permission.create!(role_id: 4, action_id: 2, sub_class: sub_class)
# end
# customer_update.each do |sub_class|
#   Permission.create!(role_id: 4, action_id: 3, sub_class: sub_class)
# end
# customer_delete.each do |sub_class|
#   Permission.create!(role_id: 4, action_id: 4, sub_class: sub_class)
# end

# store_owner_read = ["User", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart", "DetailOrder"]
# store_owner_create = ["Store", "Rate", "Order", "Cart", "Product", "Image", "Size"]
# store_owner_update = ["Store", "Product", "Size", "Image", "Cart", "Order", "User"]
# store_owner_delete = ["Product", "Size", "Image", "Cart"]

# store_owner_read.each do |sub_class|
#   Permission.create!(role_id: 2, action_id: 1, sub_class: sub_class)
# end
# store_owner_create.each do |sub_class|
#   Permission.create!(role_id: 2, action_id: 2, sub_class: sub_class)
# end
# store_owner_update.each do |sub_class|
#   Permission.create!(role_id: 2, action_id: 3, sub_class: sub_class)
# end
# store_owner_delete.each do |sub_class|
#   Permission.create!(role_id: 2, action_id: 4, sub_class: sub_class)
# end

# shipper_read = ["User", "Shipper", "Store", "Product", "Image", "Category", "Rate", "Size", "Order", "Cart", "ShipperOrder", "DetailOrder", "Device"]
# shipper_create = ["Cart", "Order", "Rate", "Device", "ShipperOrder"]
# shipper_update = ["Cart", "User", "Shipper", "ShipperOrder"]
# shipper_delete = ["Cart", "Device"]

# shipper_read.each do |sub_class|
#   Permission.create!(role_id: 3, action_id: 1, sub_class: sub_class)
# end
# shipper_create.each do |sub_class|
#   Permission.create!(role_id: 3, action_id: 2, sub_class: sub_class)
# end
# shipper_update.each do |sub_class|
#   Permission.create!(role_id: 3, action_id: 3, sub_class: sub_class)
# end
# shipper_delete.each do |sub_class|
#   Permission.create!(role_id: 3, action_id: 4, sub_class: sub_class)
# end

# User.create!(name: Faker::Name.name, email: "admin@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 1)

# User.create!(name: Faker::Name.name, email: "store001@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 2)
# Store.create!(
#   name: Faker::Name.name,
#   email: User.last.email,
#   user_id: User.last.id,
#   phone: "0973857454",
#   address: "27 Âu Cơ, Liên Chiểu, Đà Nẵng",
#   open_at: "08:00",
#   close_at: "21:00",
#   status: "accepted"
# )

# User.create!(name: Faker::Name.name, email: "store002@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 2)
# Store.create!(
#   name: Faker::Name.name,
#   email: User.last.email,
#   user_id: User.last.id,
#   phone: "0973857454",
#   address: "34 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng",
#   open_at: "08:00",
#   close_at: "21:00",
#   status: "accepted"
# )

# User.create!(name: Faker::Name.name, email: "store003@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 2)
# Store.create!(
#   name: Faker::Name.name,
#   email: User.last.email,
#   user_id: User.last.id,
#   phone: "0973857454",
#   address: "43 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng",
#   open_at: "08:00",
#   close_at: "21:00",
#   status: "accepted"
# )

# User.create!(name: Faker::Name.name, email: "store004@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 2)
# Store.create!(
#   name: Faker::Name.name,
#   email: User.last.email,
#   user_id: User.last.id,
#   phone: "0973857454",
#   address: "33 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng",
#   open_at: "08:00",
#   close_at: "21:00",
#   status: "accepted"
# )

# User.create!(name: Faker::Name.name, email: "shipper001@gmail.com", password: "123123123",
#   phone: "0973857454", address: "23 Ngô Sĩ Liên, Liên Chiểu, Đà Nẵng", role_id: 3)
# Shipper.create!(user_id: User.last.id, identity_number: "187536333")
# Device.create!(user_id: User.last.id, device_token: "f4qwpBzKoyw:APA91bGo5jbH29z1cCvQvlK7a9ejiSvW-f5V9oQMfMn1A7DbAUbGBWfsivb5z1d-xhvHmXzL2NkkBhYgCC8TvRgU64tTnLUuyy7w3sikF2vWR7wxbTjdKgxzQnwHlUIGfujizQnv-zCy")

# User.create!(name: Faker::Name.name, email: "shipper002@gmail.com", password: "123123123",
#   phone: "0973857454", address: "10 Ngô Sĩ Liên, Liên Chiểu, Đà Nẵng", role_id: 3)
# Shipper.create!(user_id: User.last.id, identity_number: "187536133")

# User.create!(name: Faker::Name.name, email: "shipper003@gmail.com", password: "123123123",
#   phone: "0973857454", address: "52 Nguyễn Lương Bằng, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng", role_id: 3)
# Shipper.create!(user_id: User.last.id, identity_number: "187533133")


# User.create!(name: Faker::Name.name, email: "customer001@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 4)
# User.create!(name: Faker::Name.name, email: "customer002@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 4)
# User.create!(name: Faker::Name.name, email: "customer003@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 4)
# User.create!(name: Faker::Name.name, email: "customer004@gmail.com", password: "123123123",
#   phone: "0973857454", address: Faker::Address.full_address, role_id: 4)


# Category.create!(name: "Homemade")
# Category.create!(name: "TooCha")
# Category.create!(name: "Cafe/Dessert")

# Store.all.each do |store|
#   Category.all.each do |category|
#     20.times.each do |i|
#       Product.create(name: Faker::Food.dish, category_id: category.id, store_id: store.id,
#         product_type: "food", description: Faker::Food.description)
#       Product.create(name: Faker::Food.fruits, category_id: category.id, store_id: store.id,
#         product_type: "drink", description: Faker::Food.description)
#     end
#   end
# end

# Product.all.each do |product|
#   Size.create!(product_id: product.id, size: "M", price: Faker::Number.between(10000, 50000))
# end
# Store.all.each do |store|
#   User.where(role_id: 4).each do |customer|
#     product = store.products.first
#     Order.create!(
#       user_id: customer.id,
#       store_id: store.id,
#       address: "54 Nguyễn Lương Bằng, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng",
#       phone: "0973857454",
#       ship_cost: 10000,
#       total: 10000 + product.sizes.first.price,
#       status: "pending"
#     )
#     DetailOrder.create!(
#       order_id: Order.last.id,
#       product_id: product.id,
#       size_id: product.sizes.first.id,
#       quantity: 1,
#       price: product.sizes.first.price
#     )
#   end
# end

# drink_img = ["https://images.foody.vn/res/g79/789966/prof/s640x400/foody-upload-api-foody-mobile-foody-mobile-foody-m-181024103203.jpg",
#   "https://images.foody.vn/res/g79/789966/s570x570/201811721345-29595276_190364838241312_581661435699800388_n.jpg",
#   "https://images.foody.vn/res/g79/789966/s570x570/2018118131110-12.jpg",
#   "https://images.foody.vn/res/g79/789966/s570x570/2018117224034-29983625_194588151152314_3934614287098253253_o.jpg"]

# food_img = ["https://images.foody.vn/res/g23/228705/s570x570/2017522141447-ga-mam-lon.jpg",
#   "https://images.foody.vn/res/g23/228705/s570x570/2017122917372-26047502_998824906924617_5151833683364276678_n.jpg",
#   "https://images.foody.vn/res/g23/228705/s570x570/2017522162019-long-ga-trung-non.jpg",
#   "https://images.foody.vn/res/g23/228705/s570x570/201712413344-24231962_513712728991654_1513292671274225434_n.jpg"]

# Product.food.each do |product|
#   food_img.each do |img|
#     product.images.create!(
#       link: img,
#       media_type: Product.name,
#       media_id: product.id
#     )
#   end
# end

# Product.drink.each do |product|
#   drink_img.each do |img|
#     product.images.create!(
#       link: img,
#       media_type: Product.name,
#       media_id: product.id
#     )
#   end
# end

# Store.all.each do |store|
#   store.images.create!(
#     link: "https://images.foody.vn/res/g30/295084/prof/s640x400/foody-mobile-15037285_72448247771-741-636147416299569312.jpg",
#     media_type: Store.name,
#     media_id: store.id
#   )
# end

Store.all.each do |store|
  store.update_columns description: Faker::Food.description
end
