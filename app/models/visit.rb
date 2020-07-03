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
        self.update(contagious: true)
        # updates all of its simultaneous visits to exposures
        simultaneous_visits.each do |visit|
            visit.update_to_exposure
        end
    end

    # returns the probability of contracting the virus through the visit based on visit duration and the historical exposure risk of the location
    def exposure_risk
        #TODO
    end

    def generate_transmissions
        simultaneous_visits.each do |contact|
            # if a contact was contagious
            if contact.contagious
                # create a possible transmission
                Transmission.create(
                    location: self.location,
                    spreader: contact.user,
                    infectee: self.user,
                    # assume that transmission occured at the earliest time that the two users were at the same location
                    date: [self.start_time, contact.start_time].max
                )
            end
        end
    end

    # formats start/end times nicely
    def times_to_s
        self.start_time.to_s(:time) + " - " + self.end_time.to_s(:time)
    end

    private

    # called after initialization
    # updates self to an exposure if any simultaneous visits are contagious
    def check_if_exposure
        if simultaneous_visits.any? {|visit| visit.contagious}
            self.update_to_exposure
        else
            self.exposure = false
        end
    end

    # called after initialization
    # updates self to contagious if its user is contagious
    def check_if_contagious
        if self.user.contagious?
            self.update_to_contagious
        else
            self.contagious = false
        end
    end

    # finds all overlapping visits at the same location
    def simultaneous_visits
        # select all visits at the same location
        Visit.where(location: self.location).select do |visit|
            # check if the start/end time ranges overlap
            if visit.user != self.user
                (self.start_time..self.end_time).overlaps?(visit.start_time..visit.end_time)
            end
        end
    end

end
