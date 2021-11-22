class Category < ApplicationRecord
    has_many :post_cats
    
    validates_presence_of :name
    validates_presence_of :description
    validates_length_of :name, maximum: 20, minimum: 2
    validates_length_of :description, maximum: 250, minimum: 5
end
