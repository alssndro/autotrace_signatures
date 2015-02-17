class StaticPagesController < ApplicationController
  def index
    @drawn_signatures = DrawnSignature.all
    @traced_signatures = TracedSignature.all
  end
end
