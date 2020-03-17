class User < ActiveRecord::Base
    include Slugafiable::InstanceMethods
    extend Slugafiable::ClassMethods
    has_secure_password
    has_many :letters
    has_many :wishlists
    validates :email, uniqueness: true
    validates :name, :email, :password, presence: true
    # validates_presence_of :name, :email, :password
end
