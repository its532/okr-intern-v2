class SectionOkrsController < ApplicationController
  before_action :sign_in_required
  before_action :set_section_okr, only: %i[edit update destroy]
  before_action :set_section_okrs, only: %i[create]

  def new
    @section_okr = SectionOkr.new
    @section_okr.key_results.build
  end

  def index
    if params[:quarter] && params[:year]
      @section_okrs = SectionOkr.where(quarter: params[:quarter]).where(year: params[:year]).order(weight: :asc)
    else
      @section_okrs = SectionOkr.where(year: SectionOkr.all.last ?  SectionOkr.all.order(:year).last.year : '').where(quarter: SectionOkr.all.last ?  SectionOkr.all.order(:year).order(:quarter).last.quarter : '').order(weight: :asc)
    end
  end

  def create
    @section_okr = SectionOkr.new(section_okr_params)
    @section_okr.weight = @section_okrs.pluck(:weight).all?(&:nil?) ? 1 : @section_okrs.maximum(:weight) + 1
    if @section_okr.save
      flash[:notice] = "OKRを登録しました"
      redirect_to section_okrs_path(quarter: @section_okr.quarter, year: @section_okr.year)
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
      redirect_to section_okrs_path(quarter: @section_okr.quarter, year: @section_okr.year)
    else
      flash[:alert] = ErrorFormatter.format(@section_okr)
      render 'edit'
    end
  end

  def destroy
    @section_okr.destroy
    flash[:notice] = "OKRを削除しました"
    redirect_to section_okrs_path(quarter: @section_okr.quarter, year: @section_okr.year)
  end

  private

  def section_okr_params
    params.require(:section_okr).permit(:section, :objective, :quarter, :year, :weight, key_results_attributes: %i[id title point _destroy])
  end

  def set_section_okr
    @section_okr = SectionOkr.find(params[:id])
  end

  def set_section_okrs
    @section_okrs = SectionOkr.where(quarter: params[:section_okr][:quarter]).where(year: params[:section_okr][:year])
  end
end
