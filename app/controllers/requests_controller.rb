class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.create request_params
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def index
    @requests = Request.all
  end

  private
  def request_params
    params.require(:request).permit(:name,:email,:department,:message)
  end
end