class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.date :date
      t.string :subject
      t.string :body
      t.timestamps null: false
    end
  end
end
