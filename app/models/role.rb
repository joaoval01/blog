class Role < ApplicationRecord
    validates_length_of :username, maximum: 15, minimum: 2
    validates_presence_of :username
end
