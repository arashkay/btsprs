class TemplatesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @templates = Template.latest
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new template_params
    if @template.save
      redirect_to templates_path
    else
      render :new
    end
  end

  def edit
    @template = Template.find params[:id]
    render :new
  end

  def update
    @template = Template.find params[:id]
    if @template.update_attributes template_params
      redirect_to templates_path
    else
      render :new
    end
  end

private

  def template_params
    params[:template].blank? ? {} : params.require(:template).permit( :name, :description, :image, :source, :price )
  end

end
