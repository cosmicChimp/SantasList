class User < ActiveRecord::Base
    has_many :letters
    has_many :wishlists
end
