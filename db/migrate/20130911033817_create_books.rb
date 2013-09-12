class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.float :amount
      t.date :date
      t.string :name
      t.text :description
    end
  end
end
