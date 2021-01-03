class Monster < ActiveRecord::Base

    belongs_to :user
    validates :name, presence: true
    validates :monster_type, presence: true


end