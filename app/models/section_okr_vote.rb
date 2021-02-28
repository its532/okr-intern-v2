class SectionOkrVote < ApplicationRecord
  belongs_to :user
  belongs_to :section_okr

  validates_with SectionOkrVoteValidator, attributes: [:user_id]
end
