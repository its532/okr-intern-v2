class PersonalOkr < ApplicationRecord
  belongs_to :user
  has_many :key_results, as: :okr
  accepts_nested_attributes_for :key_results, allow_destroy: true
end
