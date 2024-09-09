class BasePdfPonto < ApplicationPdfPonto
  attr_reader :pdf

  def initialize(title, time, date, name, cpf, enterprise, cnpj, road, neighborhood, cep,
                 localization, equipment, nsr, code, inpi)
    super()
    @title = title
    @time = time
    @date = date
    @name = name
    @cpf = cpf
    @enterprise = enterprise
    @cnpj = cnpj
    @road = road
    @neighborhood = neighborhood
    @cep = cep
    @localization = localization
    @equipment = equipment
    @nsr = nsr
    @code = code
    @inpi = inpi
  end

  def render_document
    writer_header
    write_clock_time(@time, @date)
    write_body do
      write_data_employer(@name, @cpf)
      write_enterprise(@enterprise, @cnpj, @road, @neighborhood, @cep)
      write_location(@localization)
      write_equipment(@equipment, @nsr)
      write_hash(@code)
      write_inpi(@inpi)
    end
    write_footer
  end
end