class Finish < ApplicationRecord
    belongs_to :user
    
    attr_accessor :timestamp, :datetime
end
