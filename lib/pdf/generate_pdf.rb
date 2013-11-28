module MyPDF
  require 'fileutils'

  INVOICE_DATA = {
    number: "01122",
    date: Date.today,
    firm_name: 'ООО "Прогресс-Мск"',
    header: 'Внимание! Оплата данного счета означает согласие с условиями пользовательского соглашения на сайте moika-77.ru',
    fact_address: '109382, Москва, Мариупольская ул, дом 6, офис 28',
    inn: '7723879080',
    kpp: '772301001',
    ogrn: '1137746672678',
    bank: {
      title: 'ОАО "Промсвязьбанк"',
      account: '40702810900000014607',
      bik: '044525555',
      corr_account: '30101810400000000555'
    },
    phone: '+7(495)2331195',
    director: "Горшунов Александр Владимирович",
    email: 'progress-msc@mail.ru',
    invoice_template_header: 'Образец заполнения платежного поручения',
    payer: {
      title: 'ООО "Вася Пупкин"',
      inn: '111111111',
      address: "111111, г.Москва, ул.Плательщиковая, д.1, офис 12"
    }
  }
  def generate_invoice(payer, amount)

    path = File.join(Rails.root, 'app', 'reports', "#{payer.car_wash_id}", "#{payer.id}.pdf")
    dirname = File.dirname(path)
    unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
    end
    Prawn::Document.generate(path) do
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 6
      text INVOICE_DATA[:header], align: :center
      bounding_box([0, 700], :width => 200, :height => 60) do
        image "#{Rails.root}/app/assets/images/logo100.png", width: 175, height: 50, position: :left, vposition: :top
      end
      bounding_box([210, 700], :width => 350, :height => 60) do
        font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 10, style: :bold do
          text INVOICE_DATA[:firm_name]
          text INVOICE_DATA[:fact_address]
          text "Телефон: #{INVOICE_DATA[:phone]}"
          text "E-mail: #{INVOICE_DATA[:email]}"
        end
      end
      text INVOICE_DATA[:invoice_template_header], align: :center
      table([
        ["ИНН #{INVOICE_DATA[:inn]}", "КПП #{INVOICE_DATA[:kpp]}", {content: "", borders: [:left, :right, :top]}, {content: "", borders: [:left, :right, :top]}],
        [{:content => "Получатель ", :colspan => 2, borders: [:left, :right]}, {content: "", borders: [:left, :right]}, {content: "", borders: [:left, :right]}],
        [{:content => INVOICE_DATA[:firm_name], :colspan => 2, borders: [:left, :right, :bottom]}, {content: "Сч.№", borders: [:left, :right, :bottom]}, {content: INVOICE_DATA[:bank][:account], borders: [:left, :right, :bottom]}],
        [{:content => "Банк получателя", :colspan => 2, borders: [:left, :right]}, {content: "БИК", borders: [:left, :right]}, {content: INVOICE_DATA[:bank][:bik], borders: [:left, :right]}],
        [{:content => INVOICE_DATA[:bank][:title], :colspan => 2, borders: [:left, :right, :bottom]}, {content: "Сч.№", borders: [:left, :right, :bottom]}, {content: INVOICE_DATA[:bank][:corr_account], borders: [:left, :right, :bottom]}],
      ], width: 550)

      move_down 20
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 14, style: :bold do
        text "СЧЕТ № #{payer.car_wash_id}#{payer.id}  от #{payer.created_at.strftime('%d.%m.%Y')}", align: :center
      end
      move_down 10
      stroke do
        self.line_width = 3
        horizontal_rule
      end
      move_down 20
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 8, style: :normal do
        text "Поставщик: ИНН #{INVOICE_DATA[:inn]}, КПП #{INVOICE_DATA[:kpp]}, #{INVOICE_DATA[:firm_name]}, #{INVOICE_DATA[:fact_address]}, Тел.: #{INVOICE_DATA[:phone]}"
        text "Покупатель: ИНН #{payer.inn}, #{payer.title}, #{payer.address}, телефон:  #{payer.phone}"
      end
      move_down 10
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 12, style: :bold do
        table([
          ["№", "Услуга", "Кол-во", "Ед", "Цена", "Сумма"],
          ["1", "Оплата сервисных услуг интернет-сайта moika-77.ru", "1", {content: "усл"}, "6000.00 руб.", "6000.00 руб."],
          [{content: "", borders: []}, {content: "", borders: []}, {content: "", borders: []},{content: "", borders: []}, {content: "Итого:", borders: []}, "6000.00 руб."],
          [{content: "", borders: []}, {content: "", borders: []}, {content: "", borders: []},{content: "", borders: []}, {content: "Без налога(НДС)", borders: []}, "-"]
        ], width: 550)
      end
      move_down 10
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 12, style: :normal do
        text "Всего наименований 1, на сумму 6000.00 руб."
      end
      move_down 10
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 12, style: :bold do
        text "Шесть тысяч рублей 00 копеек."
      end
      move_down 10
      stroke do
        self.line_width = 3
        horizontal_rule
      end

      move_down 10
      image "#{Rails.root}/app/assets/images/stamp.png", width: 75, height: 75, at: [80,210]
      image "#{Rails.root}/app/assets/images/podpis.png", width: 75, height: 75, at: [80,210]
      image "#{Rails.root}/app/assets/images/podpis.png", width: 75, height: 75, at: [360,210]
      font File.join(Prawn::BASEDIR, 'data','fonts','DejaVuSans.ttf'), size: 12, style: :bold do
        text_box "Руководитель                 Горшунов А.В.                 Бухгалтер                 Горшунов А.В.", at: [0,180], width: 550
      end
      stroke do
        self.line_width = 1
        horizontal_line 90,240, at: 169
      end
      stroke do
        self.line_width = 1
        horizontal_line 375,525, at: 169
      end

    end
  end
  module_function :generate_invoice
end

