class Book < ActiveRecord::Base
  attr_accessible :amount, :date, :description, :name
end
