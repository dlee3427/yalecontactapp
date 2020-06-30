class User < ApplicationRecord


    belongs_to :res_college
    has_many :tests
    has_many :visits
    has_many :locations, through: :visits
    has_many :spreading_transmissions, foreign_key: :spreader_id, class_name: 'Transmission'
    has_many :contracting_transmissions, foreign_key: :infectee_id, class_name: 'Transmission'
    has_many :spreaders, through: :contracting_transmissions
    has_many :infectees, through: :spreading_transmissions
end
