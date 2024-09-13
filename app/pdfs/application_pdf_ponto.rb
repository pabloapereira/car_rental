class ApplicationPdfPonto
  include Prawn::View
  def initialize
    upadate_font_families
    @value = 12
  end

  # Creates the horizontal line used in the PDF
  def line_gradient
    line_width 2

    stroke_gradient [0, 150], [100, 150], 'FFFFFF', '8D9399'
    stroke do
      horizontal_line 0, 100
    end

    # Second horizontal gradient from gray to white
    stroke_gradient [100, 150], [200, 150], '8D9399', 'FFFFFF'
    stroke do
      horizontal_line 100, 200
    end
  end

  def upadate_font_families
    font_families.update('NotoSerif'=> {
      :normal => Rails.root.join('app/assets/fonts/NotoSerif/NotoSerifTamil-Regular.ttf'),
      :semi_bold => Rails.root.join('app/assets/fonts/NotoSerif/NotoSerifTamil_Condensed-SemiBold.ttf'),
    })

    font_families.update('GoticA1' => {
      :normal => Rails.root.join('app/assets/fonts/GoticA1/GothicA1-Regular.ttf'),
      :semi_bold => Rails.root.join('app/assets/fonts/GoticA1/GothicA1-SemiBold.ttf'),
      :bold => Rails.root.join('app/assets/fonts/GoticA1/GothicA1-Bold.ttf')
    })

    fallback_fonts(["Courier"])
  end

  def writer_header
    repeat(:all) do
      font "NotoSerif"
      title = "Comprovante de Registro de Ponto"

      bounding_box([0, cursor], width: bounds.width, heigth: 60) do
        image 'app/assets/images/logo.png', height: 40, at: [160, 0]

        font_size(14) {draw_text title, at: [160, - 70]}
      end
    end
  end

  def write_clock_time(time, date)
    font "GoticA1", style: :bold

    time = "10:10"
    date = "10/10/1010"
    spindle = "GMT -0300"

    bounding_box([0, bounds.top - 80], width: bounds.width, heigth: 60) do
      font_size(36) { text time, align: :center, style: :semi_bold }
      font_size(12) { text  date, align: :center, style: :semi_bold}
      font_size(8) { text spindle, align: :center}
    end
  end

  def write_body
    bounding_box([20, bounds.top - 40], width: bounds.width - 70) do
      font "NotoSerif"
      yield
    end
  end

  def write_data_employer(name, cpf)
    bounding_box([0, bounds.top - 150], width: 40) do
      image 'app/assets/images/icon-person.png', height: 20
    end

    bounding_box([30, bounds.top - 150], width: bounds.width) do
      pad_bottom(2) { font_size(16) { text name, style: :semi_bold } }
      pad_bottom(10) { font_size(11) { text cpf, indent_paragraphs: @value } }

      line_gradient
    end
  end

  def write_enterprise(enterprise, cnpj, road, neighborhood, cep)
    bounding_box([0, bounds.top - 215], width: 40) do
      image 'app/assets/images/icon-department.png', height: 25
    end

    bounding_box([30, bounds.top - 215], width: bounds.width) do
      font_size(16) { text enterprise, style: :semi_bold}
      font_size(11) { text cnpj, indent_paragraphs: 12 }

      bounding_box([0, bounds.top - 40], width: bounds.width) do
        font_size(11) { text road, indent_paragraphs: @value }
        font_size(11) { text neighborhood, indent_paragraphs: @value }
        pad_bottom(11) { font_size(15) { text cep, indent_paragraphs: @value } }
      end

      line_gradient
    end
  end

  def write_location(localization)
    locat = "Localização"

    bounding_box([0, bounds.top - 335], width: 40) do
      image 'app/assets/images/icon-user-location.png', height: 25
    end

    bounding_box([30, bounds.top - 335], width: bounds.width) do
      font_size(16) { text locat, style: :semi_bold}
      pad_bottom(10) { font_size(11) { text localization, indent_paragraphs: @value } }

      line_gradient
    end
  end

  def write_equipment(equipment, nsr)
    equipment_title = "Equipamento"
    nsr_title = "NSR: "

    bounding_box([0, bounds.top - 400], width: 40) do
      image 'app/assets/images/icon-time-card.png', height: 25
    end

    bounding_box([30, bounds.top - 400], width: bounds.width) do
      font_size(16) { text "#{equipment_title} #{equipment}", style: :semi_bold}
      pad_bottom(10) { font_size(11) { text "#{nsr_title} #{nsr}", indent_paragraphs: @value } }

      line_gradient
    end
  end

  def write_hash(code)
    hash = "Código hash"

    bounding_box([0, bounds.top - 460], width: 40) do
      image 'app/assets/images/icon-code.png', height: 25
    end

    bounding_box([30, bounds.top - 460], width: bounds.width) do
      font_size(16) { text hash, style: :semi_bold}
      pad_bottom(10) { font_size(11) { text code, indent_paragraphs: @value } }

      line_gradient
    end
  end

  def write_inpi(inpi)
    title_inpi = "Registro INPI "

    bounding_box([0, bounds.top - 520], width: 40) do
      image 'app/assets/images/icon-license.png', height: 25
    end

    bounding_box([30, bounds.top - 520], width: bounds.width) do
      font_size(16) { text title_inpi, style: :semi_bold }
      font_size(11) { text inpi, indent_paragraphs: @value }
    end
  end

  def write_footer
    font "GoticA1"

    text_description = "Comprovante de Marcação de Registro de Ponto gerado de\n"\
    "acordo com as determinações da Portaria MTP 671 de 8 de\n"\
    "Novembro de 2021, assinado com Certificado Digital ICP-\n"\
    "Brasil, de acordo com o artigo 79, inciso IV."\

    bounding_box([0, bounds.top - 670], width: bounds.width) do
      bounding_box([0, cursor],width: bounds.width) do
        image 'app/assets/images/qrCode.png', height: 50, width: 50

        move_cursor_to 52
          bounding_box([70, 50], width: 200) do
            font_size(10) { text text_description, overflow: :shrink_to_fit, inline_format: true }
          end
        image 'app/assets/images/logo-icp-brasil.png', heigth: 50, width: 34, at: [290, 63]
        image 'app/assets/images/logo-inpi.png', at: [330, 45]
        image 'app/assets/images/logo-hora-legal-brasileira.png', at: [430, 45]
      end
      line_width 1

      stroke_gradient [20, 150], [20, 258], 'FFFFFF', '8D9399'

      stroke do
        vertical_line 76, 258, at: 0
      end

      stroke_gradient [40, 258], [40, 517], '8D9399', 'FFFFFF'

      stroke do
        vertical_line 258, 517, at: 0
      end
    end
  end
end