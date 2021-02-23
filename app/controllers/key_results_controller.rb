class KeyResultsController < ApplicationController
  def index
    @key_results = KeyResult.where(okr_id: params[:okr_id])
  end
end
