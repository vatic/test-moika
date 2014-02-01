class RobokassaController < Robokassa::Controller
  def notify
    super
  end
  def success
    super
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), notice: "Ваш платеж на сумму #{@payment.amount} руб. успешно принят. Спасибо!"
  end

  def fail
    super
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), warning: "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  end

  def notify_implementation(invoice_id, *args)
    Payment.find(invoice_id).verifity!
  end

  def get_options_by_notification_key(key)
    {
      test_mode: true,
      login: 'test.moika-77.ru',
      password1: 'vat123',
      password2: 'va20T11S'
    }
  end
end
