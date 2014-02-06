class NormalUserMessagesController < ApplicationController
  before_action :set_normal_user_message, only: [:show, :update]
  before_action :set_car_wash, only: [:index, :show, :new]
  before_action :set_messages_count, only: [:index, :show, :create]

  def index
      respond_to do |format|
        format.js { 
          render "index"
        }
        format.html {
          unless current_normal_user.blank?
            @normal_user_messages = @car_wash.normal_user_messages.where(receiver_id: current_normal_user.id)
          end
        }
      end
  end

  def show
  end

  def new
    @normal_user_message = NormalUserMessage.new
    @receivers = @car_wash.normal_users
  end

  def create
    @normal_user_message = NormalUserMessage.new(normal_user_message_params)
    @car_wash_id = normal_user_message_params[:car_wash_id]

    respond_to do |format|
      if @normal_user_message.save
        @messages_count = NormalUserMessage.where(
          receiver_id: normal_user_message_params[:receiver_id],
          car_wash_id: normal_user_message_params[:car_wash_id]).count
        format.html { redirect_to edit_car_wash_path(params[:car_wash_id]), notice: t('notice.messages.create.success') }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_normal_user_message
      @normal_user_message = NormalUserMessage.find(params[:id])
    end

    def set_car_wash
      @car_wash = CarWash.find(params[:car_wash_id])
    end


    def set_messages_count
    end

    def normal_user_message_params
      params.require(:normal_user_message).permit(:sender_id, :receiver_id, :car_wash_id, :subject, :body, :read)
    end
end
