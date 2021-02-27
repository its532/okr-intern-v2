class SectionOkrVotesController < ApplicationController
  def index
    @section_okr_votes = SectionOkrVote.all
  end
end
