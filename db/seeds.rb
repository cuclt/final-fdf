User.create! name:  "admin", email: "admin@gmail.com", chatwork_id: "lethicuc",
  password: "111111", password_confirmation: "111111", role: 1

4.times do |n|
  name  = "user#{n + 2}"
  email = "user#{n + 2}@gmail.com"
  chatwork_id = "user#{n + 2}"
  password = "111111"
  User.create! name: name, email: email, chatwork_id: chatwork_id,
    password: password, password_confirmation: password
end

20.times do |c|
  name = "Category#{c + 1}"
  Category.create! name: name
end

categories = Category.order(:created_at).take(10)
50.times do |p|
  name = "Product#{p + 1}"
  price = (Random.rand(4) + 1) * 10000
  quantity = Random.rand(10) + 10
  description = Faker::Lorem.sentence(50)
  category_id = Random.rand(8) + 1
  Product.create! name: name, price: price, quantity: quantity,
    category_id: category_id, description: description
end
