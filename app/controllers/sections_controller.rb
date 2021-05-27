class SectionsController < ApplicationController
  before_action :sign_in_required
  before_action :set_section, only: %i[edit update destroy]

  def new
    @section = Section.new
  end

  def index
    @sections = Section.all
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section名を登録しました"
      redirect_to sections_path
    else
      flash[:alert] = ErrorFormatter.format(@section)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "Section名を更新しました"
      redirect_to sections_path
    else
      flash[:alert] = ErrorFormatter.format(@section)
      render 'edit'
    end
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section名を削除しました"
    redirect_to sections_path
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
