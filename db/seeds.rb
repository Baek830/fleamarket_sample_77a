# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# p "create Categories"
# Category.create!(
#   name: 'コミック'
# )
# Category.create!(
#   name: 'ゲーム'
# )
# Category.create!(
#   name: 'その他'
# )

# p "create Users"
# User.create!(
#   email: 'user2@example.com',
#   nickname: 'user2',
#   first_name: 'use',
#   last_name: 'r2',
#   phonetic_first_name: 'ユーズ',
#   phonetic_last_name: 'アールツー',
#   birthday: '2020-2-2',
#   password: 'aaaaaaaa',
# )
# User.create!(
#   email: 'user3@example.com',
#   nickname: 'user3',
#   first_name: 'use',
#   last_name: 'r3',
#   phonetic_first_name: 'ユーズ',
#   phonetic_last_name: 'アールスリー',
#   birthday: '2020-3-3',
#   password: 'aaaaaaaa',
# )
# User.create!(
#   email: 'user4@example.com',
#   nickname: 'user4',
#   first_name: 'use',
#   last_name: 'r4',
#   phonetic_first_name: 'ユーズ',
#   phonetic_last_name: 'アールフォー',
#   birthday: '2020-4-4',
#   password: 'aaaaaaaa',
# )

# p "create Products"
# Product.create!(
#   name: 'キングダム 全巻セット',
#   description:
#   'キングダムの全巻セットです
#   とても面白いのでおすすめです。
#   是非一度みてみてください
  
#   よろしくお願いします',
#   price: 25000,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 2,
#   seller_id: 1,
# )

# Product.create!(
#   name: 'パワプロ2019',
#   description:
#   'パワプロくんです。
#   面白いですよ。
#   個人的にはおすすめゲームです。
  
#   マイライフで選手を育成しましょう。',
#   price: 2500,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 3,
#   seller_id: 2,
# )
# Product.create!(
#   name: 'FF7 リメイク',
#   description:
#   'FF7リメイク。
#   不朽の名作です。
  
#   超おすすめゲームなので、是非一度プレイしてみてください。',
#   price: 7500,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 2,
#   seller_id: 1,
# )
# Product.create!(
#   name: '転職の思考法',
#   description:
#   'いい本ですね。
#   転職に必要な物の考え方が網羅されています。
#   是非一度御拝読をおすすめしています。',
#   price: 900,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 2,
#   seller_id: 1,
# )
# Product.create!(
#   name: 'タコさん人形',
#   description:
#   '大阪で買いました。とても可愛いです。フワフワなので、枕に最適です。',
#   price: 800000,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 2,
#   seller_id: 1,
# )
# Product.create!(
#   name: '唐揚げ山盛りラーメン',
#   description:
#   '唐揚げと背脂マシマシのラーメンです。
#   胸焼け必死なので、事前に胃腸薬を準備しておくことをおすすめします。
#   ゆうパックで発送予定です。',
#   price: 1200,
#   condition_id: 0,
#   shipping_cost_id: 0,
#   shipment_date_id: 0,
#   prefecture_id: 1,
#   category_id: 1,
#   buyer_id: 2,
#   seller_id: 1,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Kingdom/Kingdom_1.jpeg"),
#   product_id: 6,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Kingdom/Kingdom_2.jpeg"),
#   product_id: 6,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/PAWAPURO/PAWAPURO.png"),
#   product_id: 7,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/PAWAPURO/PAWAPURO_back.png"),
#   product_id: 7,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/FF7R/FF7R_1.png"),
#   product_id: 8,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/FF7R/FF7R_2.png"),
#   product_id: 8,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/JobChange/JobChange_1.png"),
#   product_id: 9,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/JobChnage/JobChange_2.png"),
#   product_id: 9,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Octopus/Octopus_1.jpeg"),
#   product_id: 10,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Octopus/Octopus_2.jpeg"),
#   product_id: 10,
# )

# p "create Images"
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Karaage/Karaage_ramen_1.jpeg"),
#   product_id: 11,
# )
# Image.create!(
#   image: open("#{Rails.root}/db/dummy_img/Karaage/Karaage_ramen_2.jpeg"),
#   product_id: 11,
# )