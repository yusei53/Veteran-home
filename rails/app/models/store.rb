class Store < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture
  belongs_to :city
end
