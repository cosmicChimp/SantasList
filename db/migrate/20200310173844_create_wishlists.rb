class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.belongs_to :user
      t.string :content
      t.timestamps null: false
    end
  end
end
