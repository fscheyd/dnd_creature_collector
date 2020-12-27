class User < ActiveRecord::Base

    has_many :monsters
    has_secure_password
    
    validates :character_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

end