class Transmission < ApplicationRecord
    belongs_to :location
    belongs_to :spreader, class_name: 'User'
    belongs_to :infectee, class_name: 'User'
end
