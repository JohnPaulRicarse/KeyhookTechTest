class PropertiesController < ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :find_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      flash[:notice] = "Property successfully created."
      redirect_to property_path(@property)
    else
      flash[:error] = "Failed to create property."
      render :new
    end
  end

  def update
    if @property.update(property_params)
      flash[:notice] = "Property successfully updated."
      redirect_to property_path(@property)
    else
      flash[:error] = "Failed to edit property."
    end
  end

  def destroy
    @property.destroy
    flash[:notice] = "Property successfully destroyed."
    redirect_to properties_path
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :description, :address)
  end
end
