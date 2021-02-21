class PersonalOkr < ApplicationRecord
  has_many :key_results, as: :okr
  belongs_to :section
end
