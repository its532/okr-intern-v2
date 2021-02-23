class SectionOkrsController < ApplicationController
  before_action :sign_in_required
  before_action :set_section_okr, only: %i[edit update destroy]

  def new
    @section_okr = SectionOkr.new
    @section_okr.key_results.build
  end

  def index
    @section_okrs = SectionOkr.all
  end

  def create
    @section_okr = SectionOkr.new(section_okr_params)
    if @section_okr.save
      flash[:notice] = "OKRを登録しました"
      redirect_to section_okrs_path(quarter: @section_okr.quarter)
    else
      flash[:alert] = ErrorFormatter.format(@section_okr)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section_okr.update(section_okr_params)
      flash[:notice] = "OKRを更新しました"
      redirect_to section_okrs_path(quarter: @section_okr.quarter)
    else
      flash[:alert] = ErrorFormatter.format(@section_okr)
      render 'edit'
    end
  end

  def destroy
    @section_okr.destroy
    flash[:notice] = "OKRを削除しました"
    redirect_to section_okrs_path(quarter: @section_okr.quarter)
  end

  private

    def set_section_okr
      @section_okr = SectionOkr.find(params[:id])
    end

    def section_okr_params
      params.require(:section_okr).permit(:section_id, :objective, :quarter, :published_at, key_results_attributes: %i[id title point _destroy])
    end
end
