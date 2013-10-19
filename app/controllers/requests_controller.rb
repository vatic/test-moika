class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html

  # GET /requests
  # GET /requests.json
  def index
    @car_wash = CarWash.find(params[:car_wash_id])
    @requests = @car_wash.requests.where('id > ?', params[:after].to_i)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @car_wash = CarWash.find(params[:car_wash_id])
  end

  # GET /requests/new
  def new
    @car_wash = CarWash.find(params[:car_wash_id])
    @request= @car_wash.requests.build
  end

  # GET /requests/1/edit
  def edit
    @car_wash = CarWash.find(params[:car_wash_id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @car_wash = CarWash.find(params[:car_wash_id])
    @request = @car_wash.requests.build(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to [@car_wash,@request], notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :phone, :email, :text, :car_wash_id, :after)
    end
end
