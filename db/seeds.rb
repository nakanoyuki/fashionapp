# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

200.times do |no|
  item = Item.create(
    title: "服#{no}",
    image: ["image1.jpg","image2.jpg","image3.jpg","image4.jpg","image5.jpg"].sample(),
  )
  )
end