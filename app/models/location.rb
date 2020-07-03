class Location < ApplicationRecord
    has_many :visits
    has_many :users, through: :visits
    has_many :transmissions

    def transmission_percent
        if self.transmission_rate.to_f.nan?
            "-"
        else
            "#{(self.transmission_rate * 100).round}%"
        end
        
    end

    def transmission_rate
        exposure_count = self.visits.count{|visit| visit.exposure?}
        puts "exposure count"
        puts exposure_count
        transmission_count = self.transmissions.count
        puts "transmission count"
        puts transmission_count
        return transmission_count.to_f / exposure_count.to_f
    end
end
