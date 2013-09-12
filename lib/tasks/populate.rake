namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		10.times do |n|
			name = Faker::Name.name
			amount = '1.2'
			date = Time.now()
			description = "hello"
			Book.create!( name: name, amount: amount, date: date, description: description)
		end
	end
end