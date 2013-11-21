module PDF
  INVOICE_DATA = {
    firm_name: 'ООО "Прогресс-Мск"',
    header: 'Внимание! Оплата данного счета означает согласие с условиями пользовательского соглашения на сайте moika-77.ru',
    fact_address: '115211, Москва, Борисовские  пруды, д.14, корпус 3, офис 150',
    inn: '7723879080',
    kpp: '772301001',
    ogrn: '1137746672678',
    phone: '84952331195',
    email: 'progress-msc@mail.ru'
  }

  def generate_invoice
    Prawn::Document.generate('/home/vatagin/test.pdf') do
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 6
      text INVOICE_DATA[:header]
      bounding_box([0, 700], :width => 200, :height => 60) do
        image "#{Rails.root}/app/assets/images/logo100.png", width: 175, height: 50, position: :left, vposition: :top
        transparent(0.5) { stroke_bounds }
      end
      bounding_box([210, 700], :width => 350, :height => 60) do
        font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 10, style: :bold do
          text INVOICE_DATA[:firm_name]
          text INVOICE_DATA[:fact_address]
          text INVOICE_DATA[:phone]
          text INVOICE_DATA[:email]
        end
        transparent(0.5) { stroke_bounds }
      end
    end
  end
  module_function :generate_invoice
end
