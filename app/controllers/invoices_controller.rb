class InvoicesController < ApplicationController
  require File.join(Rails.root, 'lib', 'pdf', 'generate_pdf.rb')

  before_action :set_invoice, only: [:show]

  def new
    @car_wash = CarWash.find(params[:car_wash_id])
    @invoice = Invoice.new
  end

  def create
    @car_wash = CarWash.find(params[:car_wash_id])
    @invoice = @car_wash.invoices.build(invoice_params)

    respond_to do |format|
      if @invoice.save
        MyPDF.generate_invoice(@invoice, "6000")
        format.html { redirect_to car_wash_invoice_path(@car_wash, @invoice), notice: 'Счёт успешно создан' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @car_wash = CarWash.find(params[:car_wash_id])
    respond_to do |format|
        format.html {}
        format.pdf {
          send_file("#{Rails.root}/app/reports/#{@invoice.car_wash_id}/#{@invoice.id}.pdf",
                                  filename: "moika-77-#{@invoice.id}.pdf",
                                  type: "application/pdf")
        }
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(
        :title,
        :car_wash_id,
        :address,
        :phone,
        :inn
      )
    end
end
