# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "create Users"
User.create!(
  email: 'user1@example.com',
  password: 'aaaaaaaa',
)
User.create!(
  email: 'user2@example.com',
  password: 'aaaaaaaa',
)

p "create Products"
Product.create!(
  name: '鬼滅の刃 全巻セット',
  description: '鬼滅の刃の全巻セットです',
  price: 10000,
  condition_id: 0,
  shipping_cost_id: 0,
  shipment_date_id: 0,
  prefecture_id: 0,
  buyer_id: 2,
  seller_id: 1,
)

p "create Images"
Image.create!(
  image: open("#{Rails.root}/db/dummy_img/kimetsu.jpg"),
  product_id: 1,
)
Image.create!(
  image: open("#{Rails.root}/db/dummy_img/kimetsu_2.jpg"),
  product_id: 1,
)