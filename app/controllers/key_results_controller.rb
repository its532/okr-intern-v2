class KeyResultsController < ApplicationController
  def index
    @personal_key_results = PersonalKeyResult.where(personal_okr_id: params[:personal_okr_id])
  end
end
