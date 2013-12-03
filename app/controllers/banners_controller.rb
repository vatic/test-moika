class BannersController < ApplicationController
  before_action :set_banner, only: [:update, :destroy, :delete_file]
  skip_before_filter :verify_authenticity_token, :only => [:update]

  def index
    @car_wash = CarWash.find(params[:car_wash_id])
    @banners = @car_wash.banners
  end

  def update
    respond_to do |format|
      if @banner.update(banner_params)
        logger.debug banner_params
        format.json
        #{ render json: @banner.to_json(only: [:id, :file]) }
      else
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_file
    @banner.remove_file!
    respond_to do |format|
      if @banner.save!
        format.json { render json: @banner.to_json(only: [:id, :file]) }
      else
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params[:banner] = {}
      params[:banner][:text] = params[:text]
      params[:banner][:file] = params[:file]
      params[:banner][:filename] = params[:name]
      params.require(:banner).permit(:file, :filename, :text, :place, :car_wash_id)
    end

end
