# frozen_string_literal: true

class SectionOkrVoteValidator < ActiveModel::EachValidator
  def validate(section_okr_vote)
    return unless SectionOkrVote.joins(:section_okr).where(user_id: section_okr_vote.user_id).where("section_okrs.year = '#{section_okr_vote.section_okr.year}'").where("section_okrs.quarter = '#{section_okr_vote.section_okr.quarter}'").present?

    section_okr_vote.errors.add(:base, '投票済みです')
  end
end
