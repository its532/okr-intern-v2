class KeyResultCommentsController < ApplicationController
  before_action :set_key_result, only: %i[new edit]
  before_action :set_okr, only: %i[create update]
  before_action :set_key_result_comment, only: %i[edit update destroy]

  def new
    @key_result_comment = KeyResultComment.new
  end

  def create
    @key_result_comment = KeyResultComment.new(key_result_comment_params)
    if @key_result_comment.save
      flash[:notice] = "コメントを登録しました"
      redirect_to key_results_path(okr_type: @key_result_comment.key_result.okr_type, okr_id: @okr.id)
    else
      flash[:alert] = ErrorFormatter.format(@key_result_comment)
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    if @key_result_comment.update(key_result_comment_params)
      flash[:notice] = "コメントを更新しました"
      redirect_to key_results_path(okr_type: @key_result_comment.key_result.okr_type, okr_id: @okr.id)
    else
      flash[:alert] = ErrorFormatter.format(@key_result_comment)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @key_result_comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private

  def key_result_comment_params
    params.require(:key_result_comment).permit(:comment, :month, :measure, :key_result_id)
  end

  def set_okr
    if params[:key_result_comment][:okr_type] == 'SectionOkr'
      @okr = SectionOkr.find_by(id: params[:key_result_comment][:okr_id])
    else
      @okr = PersonalOkr.find_by(id: params[:key_result_comment][:okr_id])
    end
  end

  def set_key_result
    @key_result = KeyResult.find_by(id: params[:key_result_id])
  end

  def set_key_result_comment
    @key_result_comment = KeyResultComment.find_by(id: params[:id])
  end
end
