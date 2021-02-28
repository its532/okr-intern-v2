class ToppagesController < ApplicationController
  before_action :sign_in_required, only: [:index]

  def index
    @personal_okrs = current_user.personal_okrs.order(year: :desc).order(:quarter)
  end
end
