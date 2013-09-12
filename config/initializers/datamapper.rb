require "dm-core"
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

#hash = YAML.load(File.new(Rails.root + "config/database.yml"))

DataMapper.setup(:default, 'mysql://root:@localhost/dm_dev')

class User
	include DataMapper::Resource

	property :id, Serial
	property :username, String
	property :firstname, String
	property :lastname, String
	property :email, String, format: :email_address
	property :password, String, length: 10..255
	property :created_at, DateTime
	property :updated_at, DateTime

	has n, :posts

	def username= new_username
		@username = new_username.downcase
	end

end

class Post
	include DataMapper::Resource

	property :slug, String,  key: true, unique_index: true, default: lambda {|resource, prop| resource.title.downcase.gsub " ", "-"}
	property :title, String, required: true
	property :body, String,  required: true
	property :created_at, DateTime
	property :updated_at, DateTime

	belongs_to :user
end

class Book
	include DataMapper::Resource

	property :id, Serial
	property :amount, String
	property :date, DateTime
	property :name, String
	property :description, Text, :lazy => true

	def self.create_dummy_data(num)
			 num.times do |number|
			 	t.Book.new
			 	t.attributes = {:amount => number, :date => Time.now(),
			 		:name => Lorem.lorem(4,false), :description => Lorem.lorem(60,false)}
			 		t.save
			 end
	end
end


DataMapper.auto_upgrade!