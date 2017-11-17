# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.find_or_create_by(email: )

if Admin.count == 0
  Admin.create(email:'admin@mail.com', password: '123456')
end

unless Product.count > 60
  30.times do
    Product.create(name: Faker::HeyArnold.character, brand: Faker::HeyArnold.location, description: Faker::Hipster.paragraph(2, false, 4), price: 1000.15, size: 'S', color: 'Black' )
  end
end

unless Category.count > 7
  Category.create(name: "Women")
  Category.create(name: "Men")
  Category.create(name: "Tops")
  Category.create(name: "Bottoms")
  Category.create(name: "On Sale")
  Category.create(name: "New Arrivals")
end

unless ProductCategory.count > 20
  ProductCategory.create(product_id: rand(20), category_id: rand(1))
end

unless Photo.count > 10
  Photo.create(product_id:1, filelocation:"https://cdn.filestackcontent.com/noW6c3OTzWMKZi0JcOr0")
  Photo.create(product_id:2, filelocation:"https://cdn.filestackcontent.com/KksifRroR7Cs1ZAGas0M")
  Photo.create(product_id:3, filelocation:"https://cdn.filestackcontent.com/b1nBzgZRSXGMHs9MOfrF")
  Photo.create(product_id:4, filelocation:"https://cdn.filestackcontent.com/6hdnx7oZSRqCtiGe9tTB")
  Photo.create(product_id:5, filelocation:"https://cdn.filestackcontent.com/O9FNu5rTQwefQQRulXhK")
  Photo.create(product_id:6, filelocation:"https://cdn.filestackcontent.com/7aly4qQhSU6ErwB3LidI")
  Photo.create(product_id:7, filelocation:"https://cdn.filestackcontent.com/nNDKoqQ2Q9uXNWQazDu3")
  Photo.create(product_id:8, filelocation:"https://cdn.filestackcontent.com/LWuWtfjjQGOLN0Gy44M2")
  Photo.create(product_id:9, filelocation:"https://cdn.filestackcontent.com/RgXZmahvTbqSiULrQ0LQ")
  Photo.create(product_id:10, filelocation:"https://cdn.filestackcontent.com/ftGBq6wJQ4yTEuPu8RSk")
end
