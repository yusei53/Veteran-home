class StoreFromCity < ApplicationRecord
  belongs_to :store
  belongs_to :city
end
