class CarWashesController < ApplicationController
  before_action :set_car_wash, only: [:show, :edit, :update, :destroy]

  # GET /car_washes
  # GET /car_washes.json
  def index
    @car_washes = CarWash.all
  end

  # GET /car_washes/1
  # GET /car_washes/1.json
  def show
  end

  # GET /car_washes/new
  def new
    @car_wash = CarWash.new
  end

  # GET /car_washes/1/edit
  def edit
  end

  # POST /car_washes
  # POST /car_washes.json
  def create
    @car_wash = CarWash.new(car_wash_params)

    respond_to do |format|
      if @car_wash.save
        format.html { redirect_to @car_wash, notice: 'Car wash was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car_wash }
      else
        format.html { render action: 'new' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_washes/1
  # PATCH/PUT /car_washes/1.json
  def update
    respond_to do |format|
      if @car_wash.update(car_wash_params)
        format.html { redirect_to @car_wash, notice: 'Car wash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_washes/1
  # DELETE /car_washes/1.json
  def destroy
    @car_wash.destroy
    respond_to do |format|
      format.html { redirect_to car_washes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_wash
      @car_wash = CarWash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_wash_params
      params.require(:car_wash).permit(:title, :address, :lat, :lon, :contacts, :services, :price, :zones_count, :actions, :video_url1, :video_url2, :signal)
    end
end
