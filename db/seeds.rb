require 'csv'

puts "🌱 Seeding data..."

# Clear tables
Product.delete_all
Category.delete_all

# Read CSV file
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |row|
  next if row['title'].blank? || row['price'].blank? || row['stock_quantity'].blank?

  category = Category.find_or_create_by!(name: row['category'])

  Product.create!(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock_quantity'],
    category: category
  )
end

puts "✅ Seeding complete!"