class Transmission < ApplicationRecord
    belongs_to :spreader, class_name: 'User'
    belongs_to :infectee, class_name: 'User'
end
