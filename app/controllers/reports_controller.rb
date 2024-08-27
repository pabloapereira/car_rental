class ReportsController < ApplicationController

  def generate_report(filename, data, headers, title)
    respond_to do  |format|
      pdf = BasePdf.new(data: data, headers: headers, title: title)
      pdf.render_document
      send_data(pdf.render, filename: "#{filename}.pdf", type: 'aplications/pdf')
    end
  end
end