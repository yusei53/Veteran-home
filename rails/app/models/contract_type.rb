# frozen_string_literal: true

class ContractType < ActiveHash::Base
  self.data = [
    { id: 0, name: '専属専任媒介契約' },
    { id: 1, name: '専任媒介契約' },
    { id: 2, name: '一般媒介契約' },
    { id: 3, name: 'わからない' }
  ]
end
