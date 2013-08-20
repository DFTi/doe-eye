class DocumentTypesController < ApplicationController
  
  before_filter :authenticate_admin!

  def new
    @document_type = DocumentType.new
  end
  
  def create
    @document_type = DocumentType.create(document_type_params)
    if @document_type.save!
      redirect_to document_type_path(@document_type)
    else
      render 'new' 
    end
  end


  def show
    @document_type = DocumentType.find(params[:id])
  end

  def document_type_params
    params.require(:document_type).permit(:name)
  end

end
