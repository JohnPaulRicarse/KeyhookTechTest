class PropertiesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    @properties = Property.all.order(:created_at).page(params[:page]).per(10)
  end

  def show
    @property = Property.find(params[:id])
  end
end
