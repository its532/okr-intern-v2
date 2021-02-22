class KeyResultCommentsController < ApplicationController
  before_action :set_key_result, only: %i[new edit]
  # before_action :set_section_key_result_comment, only: %i[edit update destroy]

  def new
    @section_okr = SectionOkr.find_by(id: params[:section_okr_id])
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

  private

    def key_result_comment_params
      params.require(:key_result_comment).permit(:comment, :month, :measure, :key_result_id)
    end

    def set_section_okr
      @section_okr = SectionOkr.find_by(id: params[:id])
      p @key_result
    end

    def set_key_result
      @key_result = KeyResult.find_by(id: params[:key_result_id])
      p @key_result
    end

    # def set_section_key_result_comment
    #   @section_key_result_comment = SectionKeyResultComment.find_by(id: params[:id])
    # end
end
