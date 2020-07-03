class Test < ApplicationRecord
    belongs_to :facility
    belongs_to :user

    validates :result, inclusion: { in: ["positive", "negative"]}

    def index
        @tests = @user.tests.order(date: :desc)
    end

end
