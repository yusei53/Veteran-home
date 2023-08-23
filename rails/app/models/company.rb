class Company < ApplicationRecord
    has_many :store, dependent: :destroy 
    validates :name, presence: true
end
