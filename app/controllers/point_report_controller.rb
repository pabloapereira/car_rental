class PointReportController < ReportsController

  def index
    title = "titulo teste 2"
    time = "10"
    date = 20/10/1080
    name = "Pablo Andrei Pereira"
    cpf = " 282.304.570-85"
    enterprise = "PONTO GESTOR"
    cnpj = "17.620.440/0001-44"
    road = "Avenida Marcolino Martins Cabral, 1149"
    neighborhood = "Trianon, Guarapuava - PR, "
    cep = "85012-040"
    localization = "-25.35578, -51.4759"
    equipment = "2806"
    nsr = "0000"
    code = "eb962923230b6830cc5f50ef9b49b679832b206053795a4367a3a054f05a4a31"
    inpi = "BR512022000771-1 e BR512022000798-3"

    generate_report("tes", title, time, date, name, cpf, enterprise, cnpj, road, neighborhood, cep,
                    localization, equipment, nsr, code, inpi)
  end
end