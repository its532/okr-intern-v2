class KeyResult < ApplicationRecord
  belongs_to :okr, polymorphic: true
  has_many :key_result_comments, dependent: :destroy
end
