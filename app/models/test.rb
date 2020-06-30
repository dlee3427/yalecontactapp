class Test < ApplicationRecord
    belongs_to :facility
    belongs_to :user

    after_initialize :generate_transmissions

    def exposures
        self.visits.select{|visit|
        }
    end

    private

    def generate_transmissions
        if self.positive_result
            self.user.contagious = true
        end
    end

end
