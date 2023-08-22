class Prefecture < ApplicationRecord
    validates :name, presence: true
    validates :yomi, presence: true
end
