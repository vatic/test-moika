Robokassa::Interface
module Robokassa
  class Interface
    class << self
      def get_options_by_notification_key(key)
        {
          test_mode: true,
          login: 'test.moika-77.ru',
          password1: 'vat123',
          password2: 'va20T11S'
        }
      end

      def success_implementation(invoice_id, *args)
        Payment.find(invoice_id).confirm!
      end

      def fail_implementation(invoice_id, *args)
        Payment.find(invoice_id).mark_failed!
      end

      def notify_implementation(invoice_id, *args)
        Payment.find(invoice_id).verifity!
      end
    end
  end

  def self.client
    Interface.new Interface.get_options_by_notification_key(nil)
  end
end
