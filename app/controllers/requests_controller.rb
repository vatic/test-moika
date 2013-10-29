class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_filter :check_access, :only => [:edit, :destroy]
  respond_to :js, :html

  # GET /requests
  # GET /requests.json
  def index
    @car_wash = CarWash.find(params[:car_wash_id])
      respond_to do |format|
        format.js { 
          if params[:on_cpanel] == '0'
            @requests = @car_wash.requests.where('id > ?', params[:after].to_i)
            render "index"
          else
            render "on_cpanel"
          end
        }
        format.html {
          @requests = @car_wash.requests
          @unread_requests_count = @car_wash.unread_requests_count
        }
      end
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
        format.html { redirect_to @car_wash, notice: t('notice.requests.create') }
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
    #logger.debug("vatagin:request:#{params}")
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render json: @request.car_wash.requests.ids}
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
      params.require(:request).permit(:name, :phone, :email, :text, :car_wash_id, :after, :read)
    end
end
