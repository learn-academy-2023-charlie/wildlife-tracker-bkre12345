class Animal < ApplicationRecord
    validates :common_name, presence: true
    validates :scientific_binomial, presence: true 
end
