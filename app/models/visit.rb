class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :location

    after_create :check_if_exposure, :check_if_contagious

    # called when a simultaneous visit is upgraded to contagious, or upon initialization if a simultaneous visit is contagious
    # updates a visit to an exposure, notifies user
    def update_to_exposure
        # first, checks to make sure it's not already an exposure
        if !self.exposure
            # sets its own exposure status to true
            self.update(exposure: true)
            # passes itself to the user#notify method
            self.user.notify(self)
        end
    end

    # called on each of a user's recent visits when that user submits a positive test
    def update_to_contagious
        # sets itself as contagious
        self.update(exposure: true)
        # updates all of its simultaneous visits to exposures
        self.simultaneous_visits.each do |visit|
            visit.update_to_exposure
        end
    end

    # returns the probability of contracting the virus through the visit based on visit duration and the historical exposure risk of the location
    def exposure_risk
        #TODO
    end

    private

    # called after initialization
    # updates self to an exposure if any simultaneous visits are contagious
    def check_if_exposure
        if self.simultaneous_visits.any? {|visit| visit.contagious}
            self.update_to_exposure
        end
    end

    # called after initialization
    # updates self to contagious if its user is contagious
    def check_if_contagious
        if self.user.contagious?
            self.update_to_contagious
        end
    end

    # finds all overlapping visits at the same location
    def simultaneous_visits
        #TODO
    end

end
