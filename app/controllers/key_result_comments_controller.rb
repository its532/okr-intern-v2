class KeyResultCommentsController < ApplicationController
  before_action :set_key_result, only: %i[new edit]
  before_action :set_okr, only: %i[new edit]
  # before_action :set_section_key_result_comment, only: %i[edit update destroy]

  def new
    @key_result_comment = KeyResultComment.new
  end

  def create
    @key_result_comment = KeyResultComment.new(key_result_comment_params)
    if @key_result_comment.save
      flash[:notice] = "コメントを登録しました"
      # redirect_to key_results_path(section_okr_id: @section_key_result_comment.section_key_result.section_okr_id)
    else
      flash[:alert] = ErrorFormatter.format(@key_result_comment)
      # redirect_to new_section_key_result_comment_path(section_key_result_id: @section_key_result_comment.section_key_result.id)
    end
  end

  def edit
  end

  def update
    if @key_result_comment.update(key_result_comment_params)
      flash[:notice] = "コメントを更新しました"
      # redirect_to section_key_results_path(section_okr_id: @section_key_result_comment.section_key_result.section_okr_id)
    else
      flash[:alert] = ErrorFormatter.format(@key_result_comment)
      # redirect_to edit_section_key_result_comment_path(section_key_result_id: @section_key_result_comment.section_key_result.id)
    end
  end

  private

    def key_result_comment_params
      params.require(:key_result_comment).permit(:comment, :month, :measure, :key_result_id)
    end

    def set_okr
      if params[:okr_type] == 'SectionOkr'
        @okr = SectionOkr.find_by(id: params[:okr_id])
      else
        @okr = PersonalOkr.find_by(id: params[:okr_id])
      end
      p @okr
    end

    def set_key_result
      @key_result = KeyResult.find_by(id: params[:key_result_id])
      p @key_result
    end

    # def set_section_key_result_comment
    #   @section_key_result_comment = SectionKeyResultComment.find_by(id: params[:id])
    # end
end
