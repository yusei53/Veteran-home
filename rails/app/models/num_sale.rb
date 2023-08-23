# frozen_string_literal: true

class NumSale < ActiveHash::Base
  self.data = [
    { id: 0, name: '初めて' },
    { id: 1, name: '2回目' },
    { id: 2, name: '3回以上' }
  ]
end
