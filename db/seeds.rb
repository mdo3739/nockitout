# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new(name: "Mike", email: "admin@example.com", password: "helloworld", role: "admin")
admin.skip_confirmation!
admin.save!
member = User.new(name: "George", email: "member@example.com", password: "helloworld")
member.skip_confirmation!
member.save!

3.times do 
	user = User.new(
		name: 		Faker::Name.name,
		email: 		Faker::Internet.safe_email,
		password: Faker::Internet.password
	)
	user.skip_confirmation!
	user.save!
end

25.times do
	Item.create!(
		user: User.all.sample,
		name: Faker::Lorem.sentence
	)
end

puts "Seed Successful"
puts "There are #{User.all.count} users"
puts "and #{Item.all.count} things to do"