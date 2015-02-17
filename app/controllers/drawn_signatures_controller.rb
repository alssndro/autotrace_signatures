class DrawnSignaturesController < ApplicationController
  def new
    @drawn_signature = DrawnSignature.new
  end

  def create
    puts "PARAMETERS", params
    @signature = DrawnSignature.new(signature_params)

    if @signature.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def show
    @signature = DrawnSignature.find(params[:id])
  end

  private
    def signature_params
      params.require(:drawn_signature).permit(:name, :signature)
    end
end
