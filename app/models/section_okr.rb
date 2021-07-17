class SectionOkr < ApplicationRecord
  has_many :key_results, as: :okr, dependent: :destroy
  has_many :section_okr_votes, dependent: :destroy
  has_many :users, through: :section_okr_votes
  belongs_to :section
  accepts_nested_attributes_for :key_results, allow_destroy: true

  validates :section_id,  uniqueness: { scope: [:quarter, :year], message: "のOKRは既に登録されています"  }
end
