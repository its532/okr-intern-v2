class PersonalOkrsController < ApplicationController
  before_action :sign_in_required
  before_action :set_personal_okr, only: %i[edit update destroy]

  def new
    @personal_okr = PersonalOkr.new
    @personal_okr.key_results.build
  end

  def index
    @personal_okrs = PersonalOkr.all
  end

  def create
    @personal_okr = PersonalOkr.new(personal_okr_params)
    @personal_okr.user_id = current_user.id
    if @personal_okr.save
      flash[:notice] = "OKRを登録しました"
      redirect_to personal_okrs_path(quarter: @personal_okr.quarter)
    else
      flash[:alert] = ErrorFormatter.format(@personal_okr)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @personal_okr.update(personal_okr_params)
      flash[:notice] = "OKRを更新しました"
      redirect_to personal_okrs_path(quarter: @personal_okr.quarter)
    else
      flash[:alert] = ErrorFormatter.format(@personal_okr)
      render 'edit'
    end
  end

  def destroy
    @personal_okr.destroy
    flash[:notice] = "OKRを削除しました"
    redirect_to personal_okrs_path(quarter: @personal_okr.quarter)
  end

  private

    def set_personal_okr
      @personal_okr = PersonalOkr.find(params[:id])
    end

    def personal_okr_params
      params.require(:personal_okr).permit(:section_id, :objective, :objective_reason, :user_id, :quarter, key_results_attributes: %i[id title point _destroy])
    end
end
