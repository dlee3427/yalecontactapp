class User < ApplicationRecord
    belongs_to :res_college
    has_many :tests
    has_many :visits
    has_many :locations, through: :visits
    has_many :transmissions
end
