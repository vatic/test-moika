class Admin::CarWashesController < AdminController
  before_action :set_car_wash, only: [:show, :edit, :update, :destroy]
  def index
    @car_washes = CarWash.all
  end

  def show
  end

  def new
    @car_wash = CarWash.new
  end

  def edit
  end

  def create
    @car_wash = CarWash.new(car_wash_params)

    respond_to do |format|
      if @car_wash.save
        format.html { redirect_to [:admin, @car_wash], notice: 'Car wash was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car_wash }
      else
        format.html { render action: 'new' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car_wash.update(car_wash_params)
        format.html { redirect_to [:admin, @car_wash], notice: 'Car wash was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @car_wash }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    def set_car_wash
      @car_wash = CarWash.find(params[:id])
    end

    def car_wash_params
      params.require(:car_wash).permit(:title,
                                       :address,
                                       :lat, :lon,
                                       :contacts,
                                       :site_url,
                                       :video_url1, :video_url2,
                                       :vk_url, :odn_url,
                                       :blink, :videoned,
                                       :signal_type)
    end
end
