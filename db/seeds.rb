# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'ffaker'

puts 'Categories'
10.times do
	name = FFaker::Education.school_name
	Category.create(name: name )
	puts name
end

puts 'Posts'
100.times do
	Post.create(
		category_id: Category.all.order('RAND()').first.id,
		title: FFaker::Lorem.sentence,
		resume: FFaker::Lorem.phrase,
		content: FFaker::Lorem.paragraphs,
		published_at: FFaker::Time.date,
		status: true
	)
end



# Roles
puts '# Roles'
regra_admin = Role.create!(name: "admin", description: "Administrator", value: "Administrator")
regra_editor = Role.create!(name: "editor", description: "Editor", value: "Editor")
regra_client = Role.create!(name: "client", description: "Client", value: "Client")



