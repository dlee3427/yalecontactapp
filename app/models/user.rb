class User < ApplicationRecord
    belongs_to :res_college
    has_many :tests
    has_many :visits
    has_many :locations, through: :visits
    has_many :transmissions

    validates :username, uniqueness: true 
    validates :username, presence: true 
    validates :email, uniqueness: true
    validates :email, presence: true 
    validates :password, presence: true 

end
