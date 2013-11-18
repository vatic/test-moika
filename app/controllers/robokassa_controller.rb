class RobokassaController < Robokassa::Controller
  def success
    super
    @payment = Payment.find(params[:InvId])
    redirect_to dashboard_path, notice: "Ваш платеж на сумму #{@payment.amount} руб. успешно принят. Спасибо!"
  end

  def fail
    super
    redirect_to dashboard_path, varning: "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  end
end
