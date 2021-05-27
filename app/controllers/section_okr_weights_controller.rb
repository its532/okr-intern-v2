class SectionOkrWeightsController < ApplicationController
  before_action :set_section_okrs, only: %i[update]

  def update
    section_okr = SectionOkr.find_by(id: params[:id])
    target_section_okr = swap_target_section_okr(@section_okrs, section_okr.weight, params[:mode])

    if target_section_okr.present?
      SectionOkr.update([section_okr.id, target_section_okr.id], [{ weight: target_section_okr.weight }, { weight: section_okr.weight }])
      redirect_to section_okrs_path(quarter: section_okr.quarter, year: section_okr.year), notice: 'ウェイトを変更しました'
    else
      redirect_to section_okrs_path(quarter: section_okr.quarter, year: section_okr.year), alert: '入れ替え対象がありません'
    end
  end

  private

  def set_section_okrs
    @section_okrs = SectionOkr.where(quarter: params[:quarter]).where(year: params[:year]).order(:weight)
  end

  def swap_target_section_okr(section_okrs, weight, mode)
    case mode
    when 'up'
      section_okrs.where('weight < ?', weight).last
    when 'down'
      section_okrs.where('weight > ?', weight).first
    end
  end
end
