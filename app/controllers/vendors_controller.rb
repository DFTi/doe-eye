class VendorsController < ApplicationController
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
  
  def show
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:name, :api_key, :api_password)
  end

end
