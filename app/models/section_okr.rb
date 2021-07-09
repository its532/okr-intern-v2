class SectionOkr < ApplicationRecord
  has_many :key_results, as: :okr
  has_many :section_okr_votes, dependent: :destroy
  has_many :users, through: :section_okr_votes
  accepts_nested_attributes_for :key_results, allow_destroy: true

  validates :section,  uniqueness: { scope: [:quarter, :year], message: "のOKRは既に登録されています"  }
end
