class User < ApplicationRecord
    belongs_to :res_college
    has_many :tests
    has_many :visits
    has_many :locations, through: :visits
    has_many :spreading_transmissions, foreign_key: :spreader_id, class_name: 'Transmission'
    has_many :contracting_transmissions, foreign_key: :infectee_id, class_name: 'Transmission'
    has_many :spreaders, through: :contracting_transmissions
    has_many :infectees, through: :spreading_transmissions

    has_secure_password

    # returns the user's most recent negative test
    def last_negative_test
        self.tests.where({result: "positive"}).order(date: :desc).first
    end

    # returns the user's most recent test
    def last_test
        self.tests.order(date: :desc).first
    end

    # returns whether or not the user is contagious based on their most recent test result
    def contagious?
        self.last_test.result == "positive"
    end

    # returns all of a user's visits history after a given date
    def visits_after(date)
        self.visits.where("date > ?", date)
    end

    # called when a user tests positive
    # creates instances of Transmission for where, when, and from whom the user may have contracted the virus in the past two weeks
    def find_possible_transmissions(test)
        self.visits_after(test.date - 14.days).where({exposure: true}).each do |visit|
            #TODO - figure out parameters for 
            Transmission.create(

            )
        end
    end

    # called when a user tests positive
    # updates all of the user's visits since their last test result to contagious
    def update_new_visits_as_contagious
        self.visits_after(self.last_test.date).each do |visit|
            visit.update_to_contagious
        end
    end

    # called when any of a user's visits have been updated to exposures
    def notify(visit)
        #TODO - display alert on homepage
        #TODO - email visit details and exposure risk
    end

end
