# frozen_string_literal: true

class PropertyRoomPlan < ActiveHash::Base
  self.data = [
    { id: 1, name: '1R' },
    { id: 2, name: '1K / 1DK' },
    { id: 3, name: '1LK / 1LDK' },
    { id: 4, name: '2K / 2DK' },
    { id: 5, name: '2LK / 2LDK' },
    { id: 6, name: '3K / 3DK' },
    { id: 7, name: '3LK / 3LDK' },
    { id: 8, name: '4K / 4DK' },
    { id: 9, name: '5K / 5DK' },
    { id: 10, name: '5LK / 5LDK' },
    { id: 11, name: '6K / 6DK' },
    { id: 12, name: '6LK / 6LDK' },
    { id: 13, name: '6LK / 6LDK以上' }
  ]
end
