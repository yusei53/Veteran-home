class Prefecture < ApplicationRecord
    has_many :city, dependent: :destroy
    validates :name, presence: true
    validates :yomi, presence: true
end
