class SectionOkrVotesController < ApplicationController
  before_action :set_section_okrs, only: %i[new]

  def new
    @section_okr_vote = SectionOkrVote.new
  end

  def index
    @section_okr_votes = SectionOkrVote.all
  end

  def create
    @section_okr_vote = SectionOkrVote.new(section_okr_votes_params)
    @section_okr_vote.user_id = current_user.id
    p @section_okr_vote.section_okr
    if @section_okr_vote.save
      flash[:notice] = "投票完了しました"
      redirect_to section_okr_votes_path
    else
      flash[:alert] = ErrorFormatter.format(@section_okr_vote)
      render 'new'
    end
  end

  private

    def section_okr_votes_params
      params.require(:section_okr_vote).permit(:comment, :quarter, :year, :user_id, :section_okr_id)
    end

    def set_section_okrs
      if params[:quarter] && params[:year]
        @section_okrs = SectionOkr.where(quarter: params[:quarter]).where(year: params[:year])
      else
        @section_okrs = SectionOkr.where(year: SectionOkr.all.last ?  SectionOkr.all.order(:year).last.year : '').where(quarter: SectionOkr.all.last ?  SectionOkr.all.order(:year).order(:quarter).last.quarter : '')
      end
      p @section_okrs
    end
end
