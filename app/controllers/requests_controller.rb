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

    # @requests = Request.page(params[:page]).per(7)
    @requests = Request.all
    # @requests = Request.order(:done).page params[:page]

    if params[:search]
      @requests = Request.search(params[:search]).order("created_at DESC")
    else
      @requests = Request.all.order('created_at DESC')
    end
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    request = Request.find params[:id]
    request.update request_params
    redirect_to request_path(request)
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit(:name,:email,:department,:message)
  end
end
