class SectionOkrVotesController < ApplicationController
  before_action :set_section_okr_vote, only: %i[edit update destroy]
  before_action :set_section_okrs, only: %i[new edit]

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
      redirect_to section_okrs_path(quarter: @section_okr_vote.section_okr.quarter, year: @section_okr_vote.section_okr.year)
    else
      flash[:alert] = ErrorFormatter.format(@section_okr_vote)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section_okr_vote.update(section_okr_votes_params)
      flash[:notice] = "投票を更新しました"
      redirect_to section_okr_votes_path
    else
      flash[:alert] = ErrorFormatter.format(@section_okr)
      render 'edit'
    end
  end

  def destroy
    @section_okr_vote.destroy
    flash[:notice] = "投票を削除しました"
    redirect_to section_okr_votes_path
  end

  private

    def section_okr_votes_params
      params.require(:section_okr_vote).permit(:comment, :quarter, :year, :user_id, :section_okr_id)
    end

    def set_section_okr_vote
      @section_okr_vote = SectionOkrVote.find(params[:id])
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
