class ReportsController < ApplicationController

  def generate_report(filename, title, time, date, name, cpf, enterprise, cnpj, road, neighborhood, cep,
                      localization, equipment, nsr, code, inpi)
    respond_to do |format|
      format.pdf do
        pdf = BasePdfPonto.new(title, time, date, name, cpf, enterprise, cnpj, road, neighborhood, cep,
                               localization, equipment, nsr, code, inpi)
        pdf.render_document
        send_data(pdf.render, filename: "#{filename}.pdf", type: 'aplications/pdf')
      end
    end
  end
end