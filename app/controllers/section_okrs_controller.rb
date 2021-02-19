class SectionOkrsController < ApplicationController
  def index
    @section_okrs = SectionOkr.all
  end
end
