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

unless Photo.count > 10
  Photo.create(product_id:7, filelocation:"https://cdn.filestackcontent.com/RgXZmahvTbqSiULrQ0LQ")
  Photo.create(product_id:11, filelocation:"https://cdn.filestackcontent.com/KksifRroR7Cs1ZAGas0M")
end
