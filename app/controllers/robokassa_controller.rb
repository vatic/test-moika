class RobokassaController < Robokassa::Controller
  def success
    super
    @car_wash = CarWash.find(params[:car_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), notice: "Ваш платеж на сумму #{@payment.amount} руб. успешно принят. Спасибо!"
  end

  def fail
    super
    @car_wash = CarWash.find(params[:car_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), varning: "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  end
end
