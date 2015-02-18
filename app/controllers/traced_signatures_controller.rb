class TracedSignaturesController < ApplicationController
  def new
    @traced_signature = TracedSignature.new
  end

  def create
    @traced_signature = TracedSignature.new(traced_signature_params)

    if @traced_signature.save
      redirect_to @traced_signature
    else
      render action: 'new'
    end
  end

  def show
    @signature = TracedSignature.find(params[:id])
  end

  private

  def traced_signature_params
    params.require(:traced_signature).permit(:name, :source_image)
  end
end
