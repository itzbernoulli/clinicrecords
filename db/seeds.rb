# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rating.delete_all
Review.delete_all
Merchant.delete_all
Category.delete_all
UserRole.delete_all
Role.delete_all
User.delete_all


image = "https://cdn.shopify.com/s/files/1/1089/8530/products/Brain-Bag-Olive-Cordura-Steel-Parapack_1024x1024.jpg?v=1521490363"
long_description_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
short_description_text = "This is a text to describe the merchant_value prop."
category_description = "This is a text that describes what this section does for dummies."

#create the name of users
names = ["Ayo", "Deji", "John", "Tobi", "Sam", "Monica", "Stella"]

#get the length of the user name array
name_len = names.length

##Create db roles
roles = ["admin","hitter","anonymous"]

#get the length of the roles 3
role_len = roles.length

role_len.times do |n|
	role = Role.create( name: roles[n] )

	puts "Role " + role.name + " created"
end

db_roles = Role.all
db_roles_len = db_roles.length

puts "Role length " + db_roles_len.to_s

name_len.times do |n|

	user = User.create(
		first_name: names[n],
		last_name: names[n],
		email: names[n]+"@gmail.com",
		password: names[n]+"@gmail.com")

	puts user.first_name + " created"

	r = Random.new
	r = r.rand(0...db_roles_len-1)

 	puts "R is " + r.to_s

	userrole = UserRole.create(
		user_id: user.id,
		role_id: db_roles[r].id)

	puts userrole.role.name + " user " + userrole.user.email + " created"
end


categories = ["Bags","Shoes","Photography","Computers","Phones","Cars","Perfumes","Laptops"]

merchants = ["merchant_1","merchant_2","merchant_3","merchant_4","merchant_5","merchant_6","merchant_7","merchant_8","merchant_9","merchant_10"]

reviews = [long_description_text+" Review _1",long_description_text+" Review _2",long_description_text+" Review _3",long_description_text+" Review_4",long_description_text+" Review_5",long_description_text+" Review_6",long_description_text+" Review_7",long_description_text+" Review_8",long_description_text+" Review_9",long_description_text+" Review_10",long_description_text+" Review_11",long_description_text+" Review_12"]
cat_len = categories.length
mer_len = merchants.length
rev_len = reviews.length

# r = Random.new

users = User.all
user_len = users.length

cat_len.times do |n|
	cat = Category.create(
		name: categories[n],
		image: image,
		description: category_description)


	puts "Category " + categories[n] + "created"

	mer_len.times do |m|

		random_user = Random.new
		random_user = random_user.rand(0...user_len)

		mer = Merchant.create(
			instagram: merchants[m],
			facebook: merchants[m],
			twitter: merchants[m],
			website: "www." + merchants[m] +".com",
			feature_image: image,
			short_description: short_description_text,
			long_description: long_description_text,
			category_id: cat.id,
			user_id: users[random_user].id)
		puts "merchant " + merchants[m] + "created"

		rev_len.times do |r|

			random_user = Random.new
			random_user = random_user.rand(0...user_len)
			# r = r.rand(1...5)
		Review.create(
				content: reviews[r],
				merchant_id: mer.id,
				user_id: users[random_user].id
				)

			puts "Review " + reviews[r] + "created"
		end

		10.times do |rating|

			random_user = Random.new
			random_user = random_user.rand(0...user_len)
			# r = r.rand(1...5)
			rating = Rating.create(
				score: Random.rand(1...10),
				merchant_id: mer.id,
				user_id: users[random_user].id
				)
			puts "Rating " + rating.score.to_s + "created"
		end
	end 
end


