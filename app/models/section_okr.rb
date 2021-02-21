class SectionOkr < ApplicationRecord
  has_many :key_results, as: :okr
  belongs_to :section
  accepts_nested_attributes_for :key_results, allow_destroy: true
end
