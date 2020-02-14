# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('storage', 'Products.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

require "open-uri"
Faker::Config.locale = :fr

last_id_category = Category.maximum(:id).to_i
puts last_id_category

Favorite.destroy_all
Product.destroy_all
Category.destroy_all
Message.destroy_all
Offer.destroy_all
Rating.destroy_all
User.destroy_all

pictures = ["https://images.unsplash.com/photo-1573516515928-92444ec46ce2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1555&q=80","https://images.unsplash.com/photo-1566677379359-5ef1321fcb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80","https://images.unsplash.com/photo-1551823934-61391394a6ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1993&q=80","https://images.unsplash.com/photo-1545792583-533185490f52?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=958&q=80","https://images.unsplash.com/photo-1567659893051-0b046978d0f0?ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80", "https://images.unsplash.com/photo-1533392151650-269f96231f65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1546189827-c4cd7d1cc07d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80","https://images.unsplash.com/photo-1551823934-3d82b4d2fd1d?ixlib=rb-1.2.1&auto=format&fit=crop&w=2010&q=80","https://images.unsplash.com/photo-1559782010-0d605c1ee09d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559782153-f28786b4940d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1556337137-c7de215dfa78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559781564-b5a5ba6a495f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1559781726-b7c7e77515ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80","https://images.unsplash.com/photo-1555438987-8267a219d1f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80","https://images.unsplash.com/photo-1559017895-ca553c995892?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80","https://images.unsplash.com/photo-1483135504826-f60ad6c7924e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1502208391170-1a420ac9cf57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=355&q=80","https://images.unsplash.com/photo-1511608170515-b4557034155c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1474901879171-d6f34b3a99b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80","https://images.unsplash.com/photo-1527236438218-d82077ae1f85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1521849960527-40b1be1fc7d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80","https://images.unsplash.com/photo-1488631868091-25e5307e8f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80"]


 ## create categories tree, not using a loop nor faker as it's a static list
parent_a = Category.new( name: "Collectibles & art", id_parent: nil)
parent_a.save!
b = Category.new( name: "Collectibles", id_parent:parent_a.id)
b.save!
b = Category.new( name: "Strange", id_parent:parent_a.id)
b.save!
b = Category.new( name: "Antiques", id_parent:parent_a.id)
b.save!
b = Category.new( name: "Sports", id_parent:parent_a.id)
b.save!

parent_b = Category.new( name: "Electronics", id_parent:nil)
parent_b.save!
b = Category.new( name: "Computers & tablets", id_parent:parent_b.id)
b.save!
b = Category.new( name: "Cameras & photo", id_parent:parent_b.id)
b.save!
b = Category.new( name: "TV, audio & surveillance", id_parent:parent_b.id)
b.save!
b = Category.new( name: "Cell phones & accessoriesname", id_parent:parent_b.id)
b.save!

parent_c = Category.new( name: "Entertainment", id_parent:nil)
parent_c.save!
b = Category.new( name: "Video games & consoles", id_parent:parent_c.id)
b.save!
b = Category.new( name: "Music", id_parent:parent_c.id)
b.save!
b = Category.new( name: "DVDs & movies", id_parent:parent_c.id)
b.save!
b = Category.new( name: "Tickets", id_parent:parent_c.id)
b.save!

parent_d = Category.new( name: "Fashion", id_parent:nil)
parent_d.save!
b = Category.new( name: "Women", id_parent:parent_d.id)
b.save!
b = Category.new( name: "Men", id_parent:parent_d.id)
b.save!
b = Category.new( name: "Watches", id_parent:parent_d.id)
b.save!
b = Category.new( name: "Shoes", id_parent:parent_d.id)
b.save!

parent_e = Category.new( name: "Home & garden", id_parent:nil)
parent_e.save!
b = Category.new( name: "Garden & outdoor", id_parent:parent_e.id)
b.save!
b = Category.new( name: "Crafts", id_parent:parent_e.id)
b.save!
b = Category.new( name: "Home improvement", id_parent:parent_e.id)
b.save!
b = Category.new( name: "Furniture", id_parent:parent_e.id)
b.save!

parent_f = Category.new( name: "Motors", id_parent:nil)
parent_f.save!
b = Category.new( name: "Parts  ", id_parent:parent_f.id)
b.save!
b = Category.new( name: "Cars & trucks", id_parent:parent_f.id)
b.save!
b = Category.new( name: "Motorcycles", id_parent:parent_f.id)
b.save!
b = Category.new( name: "Passenger vehicles", id_parent:parent_f.id)
b.save!

parent_g = Category.new( name: "Sporting goods", id_parent:nil)
parent_g.save!
b = Category.new( name: "Outdoor sports", id_parent:parent_g.id)
b.save!
b = Category.new( name: "Team sports", id_parent: parent_g.id)
b.save!
b = Category.new( name: "Exercise & fitness", id_parent:parent_g.id)
b.save!
b = Category.new( name: "Golf ", id_parent:parent_g.id)
b.save!

parent_h = Category.new( name: "Toys & hobbies", id_parent:nil)
parent_h.save!
b = Category.new( name: "Vintage & Antiques", id_parent:parent_h.id)
b.save!
b = Category.new( name: "Kids toys", id_parent:parent_h.id)
b.save!
b = Category.new( name: "Action figures", id_parent:parent_h.id)
b.save!
b = Category.new( name: "Dolls & bears", id_parent:parent_h.id)
b.save!

parent_i = Category.new( name: "Other categories", id_parent: nil)
parent_i.save!
b = Category.new( name: "Books", id_parent:parent_i.id)
b.save!
b = Category.new( name: "Health & beauty", id_parent:parent_i.id)
b.save!
b = Category.new( name: "Music instruments", id_parent:parent_i.id)
b.save!
b = Category.new( name: "Business & industrial", id_parent:parent_i.id)
b.save!

puts Category.all


20.times do |index|
  file = URI.open(pictures[index])
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

  new_id_1 = 0
  new_id_2 = 0
  new_name_1 = ""
  new_name_2 = ""

  result_1 = csv.each.with_index  do |variable, x|
    if x == (index + 1)
      new_id_1 = variable['Id'].to_i + last_id_category.to_i
      new_name_1 = variable['Name']
    end
  end
  puts new_id_1

  result_2 = csv.each.with_index  do |variable, x|
    if x == (index + 24)
      new_id_2 = variable['Id'].to_i + last_id_category.to_i
      new_name_2 = variable['Name'].to_s
    end
  end

  c = Product.new(
    name: new_name_1,
    user_id: a.id,
    category_id: new_id_1
    )
  c.images.attach(io: file, filename: "nes-#{index}.png", content_type: 'image/png')

  c.save!

  #d = Product.new(
  #  name: new_name_2,
  #  user_id: a.id,
  #  category_id: new_id_2
  #  )
  #d.save!

end


e = User.new(
  email:"gonzalo@gmail.com",
  password:"123456",
  first_name:"Gonzalo",
  last_name:"Etse",
  birthday:"1987-01-14"
  )
e.save!


