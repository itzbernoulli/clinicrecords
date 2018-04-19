# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["Ayo", "Deji", "John", "Tobi", "Sam", "Monica", "Stella"]

name_len = names.length

roles = Role.all

role_len = roles.length


name_len.times do |n|
	user = User.create(
		first_name: names[n],
		last_name: names[n],
		email: names[n]+"@gmail.com",
		password: names[n]+"@gmail.com")

	r = Random.new
	r = r.rand(0..role_len)
 
	UserRole.create(
		user: user,
		role: roles[r])
end