class GeneralController < ApplicationController

  def index
    @templates = Template.latest.page params[:page]
    render layout: false
  end

end
