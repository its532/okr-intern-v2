class SectionOkrsController < ApplicationController
  before_action :sign_in_required
  # before_action :set_section_okr, only: %i[edit update destroy]

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

  private

    # def set_section_okr
    #   @section_okr = SectionOkr.find(params[:id])
    # end

    def section_okr_params
      params.require(:section_okr).permit(:section_id, :objective, :quarter, key_results_attributes: %i[id key_result key_result_point _destroy])
    end
end
