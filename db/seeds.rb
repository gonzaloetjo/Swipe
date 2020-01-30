# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
Faker::Config.locale = :fr

Category.destroy_all
Favorite.destroy_all
Message.destroy_all
Offer.destroy_all
Product.destroy_all
Rating.destroy_all
User.destroy_all

pictures = ["https://images.unsplash.com/photo-1573516515928-92444ec46ce2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1555&q=80","https://images.unsplash.com/photo-1566677379359-5ef1321fcb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80","https://images.unsplash.com/photo-1551823934-61391394a6ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1993&q=80","https://images.unsplash.com/photo-1545792583-533185490f52?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=958&q=80","https://images.unsplash.com/photo-1567659893051-0b046978d0f0?ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80", "https://images.unsplash.com/photo-1533392151650-269f96231f65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1546189827-c4cd7d1cc07d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80","https://images.unsplash.com/photo-1551823934-3d82b4d2fd1d?ixlib=rb-1.2.1&auto=format&fit=crop&w=2010&q=80","https://images.unsplash.com/photo-1559782010-0d605c1ee09d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559782153-f28786b4940d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1556337137-c7de215dfa78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559781564-b5a5ba6a495f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559781726-b7c7e77515ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1555438987-8267a219d1f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80","https://images.unsplash.com/photo-1559017895-ca553c995892?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80","https://images.unsplash.com/photo-1483135504826-f60ad6c7924e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1502208391170-1a420ac9cf57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=355&q=80","https://images.unsplash.com/photo-1511608170515-b4557034155c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1474901879171-d6f34b3a99b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80","https://images.unsplash.com/photo-1527236438218-d82077ae1f85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1521849960527-40b1be1fc7d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1488631868091-25e5307e8f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80"]


20.times do |index|
  #file = URI.open(pictures[index])
  #p file
  a = User.new(
    email:Faker::Internet.email,
    password:"123456",
    first_name:Faker::Name.first_name(),
    last_name:Faker::Name.last_name(),
    #phone_number:("23212312"),
    birthday:"2000-01-14"
    )
  #a.photo.attach(io: file filename: "nes-#{index}.png", content_type: 'image/png')
  a.save!

  b = Category.new(
    name:["Home","Outsidedoor"].sample(1).join,
    description:Faker::GreekPhilosophers.quote
    )

  b.save!

  p a


  c = Product.new(
    name:["Table","Ping Pong Table","Iphone 6s","Shirt","Set of cups","Bag","Electrical Scooter Xiamoi", "Old coca cola bottle"].sample(1).join,
    user_id: a.id,
    category_id: b.id
    )

  if Category.count > 1
    p "culo"
    c.save!
  end


end
