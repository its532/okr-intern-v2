class PersonalOkrsController < ApplicationController
  before_action :sign_in_required
  # before_action :set_section_okr, only: %i[edit update destroy]

  def new
    @personal_okr = PersonalOkr.new
    # @personal_okr.personal_key_results.build
  end

  def index
    @personal_okrs = PersonalOkr.all
  end


  private

    # def set_personal_okr
    #   @personal_okr = PersonalOkr.find(params[:id])
    # end

    def personal_okr_params
      params.require(:personal_okr).permit(:section_id, :objective, :objective_reason, :user_id, :quarter)
    end
end
