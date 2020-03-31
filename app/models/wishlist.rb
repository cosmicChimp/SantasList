class Wishlist < ActiveRecord::Base
    belongs_to :user
    validates :content, presence: true

    def self.search(search)
        where("content like ?", "%#{search}%")
    end

end


# custom route GET route
#all wishes based on content 