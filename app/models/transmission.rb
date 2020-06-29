class Transmission < ApplicationRecord
    belongs_to :origin, class_name: 'User'
    belongs_to :new_patient, class_name: 'User'
end
