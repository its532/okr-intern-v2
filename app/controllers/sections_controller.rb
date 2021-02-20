class SectionsController < ApplicationController
  before_action :sign_in_required

  def new
    @section = Section.new
  end

  def index
    @sections = Section.all
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "OKRを登録しました"
      redirect_to sections_path
    else
      flash[:alert] = ErrorFormatter.format(@section)
      render 'new'
    end
  end

  private

    # def set_section
    #   @section = SectionOkr.find(params[:id])
    # end

    def section_params
      params.require(:section).permit(:name)
    end
end
