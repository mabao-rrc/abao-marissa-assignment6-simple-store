require 'faker'

puts "🌱 Seeding products..."

676.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 1.0..100.0),
    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end

puts "✅ Done seeding!"