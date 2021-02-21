class KeyResult < ApplicationRecord
  belongs_to :okr, polymorphic: true
end
