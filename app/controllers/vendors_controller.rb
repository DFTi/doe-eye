class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create(vendor_params)
    if @vendor.save!
      redirect_to vendor_path(@vendor)
    else
      render 'new' 
    end
  end
  
  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update(vendor_params)
      redirect_to vendor_path(@vendor)
    else
      render "edit"
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:name, :api_key, :api_password)
  end
end
