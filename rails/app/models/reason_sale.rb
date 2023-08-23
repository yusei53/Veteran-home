# frozen_string_literal: true

# 売却理由

class ReasonSale < ActiveHash::Base
  self.data = [
    { id: 0, name: '住み替え' },
    { id: 1, name: '相続' },
    { id: 2, name: '転勤、転職' },
    { id: 3, name: '離婚' },
    { id: 4, name: '資産整理' },
    { id: 5, name: '金銭的な理由' },
    { id: 6, name: 'その他' }
  ]
end
