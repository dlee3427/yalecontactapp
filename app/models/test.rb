class Test < ApplicationRecord
    belongs_to :facility
    belongs_to :user

    validates :result, inclusion: { in: ["positive", "negative"]}

end
