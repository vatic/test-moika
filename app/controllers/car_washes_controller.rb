class CarWashesController < ApplicationController
  before_action :set_car_wash, only: [:show, :edit, :update, :update_main_action, :destroy]
  before_action :set_actions, only: [:show, :edit]
  before_filter :check_access, :only => [:new, :edit, :update, :destroy]

  # GET /car_washes
  # GET /car_washes.json
  def index
    @car_washes = CarWash.all
  end

  def update_map
    @car_washes = CarWash.where('updated_at > ?', params[:updated_at])
    @updated_at = Time.now.utc
  end

  # GET /car_washes/1
  # GET /car_washes/1.json
  def show
    if @car_wash.nil?
      redirect_to :index
    end
    @left_actions = @car_wash.actions_by_type(:left)
    @bottom1_actions = @car_wash.actions_by_type(:bottom1)
    @bottom2_actions = @car_wash.actions_by_type(:bottom2)
    @vacancy_actions = @car_wash.actions_by_type(:vacancy)
    @unread_requests_count = @car_wash.requests.unread.count
    @banners = @car_wash.banners
  end

  def new
    @car_wash = CarWash.new
  end

  # GET /car_washes/1/edit
  def edit
    @full = (params['full'] == '1')
    @payment = Payment.new(car_wash_id: @car_wash.id, amount: 6000.00)
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
    params_actions = params[:car_wash][:actions]
    
    unless params_actions.blank?
      params_actions.each do |params_action|
        action = @car_wash.actions_by_type(params_action[:action_type_text]).first
        if action.nil?
         @car_wash.actions.build(
           action_text: ActionText.create(text: params_action[:text]), 
           action_type: ActionType.find_by(text: params_action[:action_type_text]))
        else
         action.action_text.update(text: params_action[:text])
        end
      end
    end

    respond_to do |format|
      if @car_wash.update(car_wash_params)
        format.html { redirect_to @car_wash, notice: 'Car wash was successfully updated.' }
        format.json { head :no_content }
        format.js { 
          if params_actions.blank?
            render "signal_update"
          else
            case params_actions.first[:action_type_text]
            when "main"
              render 'main_action_update'
            when "left"
              render 'left_action_update'
            end
          end
        }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car_wash.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_actions
  end

  def update_main_action
      m_actions = @car_wash.actions.includes(:action_type).where("action_types.text" => "main")
      if m_actions.empty?
        @car_wash.actions << Action.create(action_text: ActionText.create(text: car_wash_params[:main_action_text]), action_type: ActionType.find_by(text: 'main'))
      else
        m_actions.first.action_text.update(text: car_wash_params[:main_action_text])
      end
      
      respond_to do |format|
        format.json { respond_with_bip(@car_wash) }
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
    def set_car_wash
      @car_wash = CarWash.find(params[:id])
    end

    def set_actions
      @actions = @car_wash.try(:actions)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_wash_params
      params.require(:car_wash).permit(
        :main_action_text, 
        :title, 
        :address, 
        :lat, 
        :lon, 
        :contacts, 
        :services, 
        :price, 
        :zones_count, 
        :video_url1, 
        :video_url2, 
        :signal,
        :site_url,
        :blink,
        :signal_changed,
        :updated_at,
        :videoned,
        :signal_type,
        actions_attributes: [:text, :action_type_text])
    end
end
