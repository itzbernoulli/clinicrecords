# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Record.delete_all
Role.delete_all
User.delete_all


image = "https://cdn.shopify.com/s/files/1/1089/8530/products/Brain-Bag-Olive-Cordura-Steel-Parapack_1024x1024.jpg?v=1521490363"
long_description_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
short_description_text = "This is a text to describe the merchant_value prop."
category_description = "This is a text that describes what this section does for dummies."


##Create db roles
roles = ["superadmim","admin","frontdesk","nurse","doctor","pharmacist"]

#get the length of the roles 3
role_len = roles.length

role_len.times do |n|
	role = Role.create( name: roles[n] )

	puts "Role " + role.name + " created"
end

db_roles = Role.all
db_roles_len = db_roles.length

puts "Role length " + db_roles_len.to_s

role_len.times do |n|

	user = User.create(
		first_name: roles[n],
		last_name: roles[n],
		email: roles[n]+"@demo.com",
		password: roles[n]+"@demo.com")

	puts user.first_name + " created"


	userrole = UserRole.create(
		user_id: user.id,
		role_id: db_roles[n].id)

	puts userrole.role.name + " user " + userrole.user.email + " created"

end

