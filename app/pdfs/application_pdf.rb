class ApplicationPdf
  include Prawn::View

  def initialize
    upadate_font_families
  end

  def upadate_font_families
    font_families.update('OpenSans' => {
      :normal => Rails.root.join('app/assets/fonts/OpenSans/OpenSans-Regular.ttf'),
      :light => Rails.root.join('app/assets/fonts/OpenSans/OpenSans-Light.ttf'),
      :bold => Rails.root.join('app/assets/fonts/OpenSans/OpenSans-Bold.ttf'),
    })

    fallback_fonts(["Courier"])
  end

  def write_header
    repeat(:all) do
      font "OpenSans"

      title = "Car"
      date_text = "Date: #{Date.today.strftime('%d/%m/%y')}"

      bounding_box([0, cursor], width: bounds.width, heigth: 40) do
        font_size(17) { draw_text title, at: [15,45] }

        # Cria uma linha horizontal na biunding_box
        stroke_horizontal_rule
      end
    end
  end

  def write_title(title)
    font_size(27) { text title, align: :center, style: :bold, color: '000030'}
  end

  def write_body
    bounding_box([0, bounds.top - 80], width: bounds.width) do
      font "OpenSans"
      yield
    end
  end

  def write_table(data:, header:, width: bounds.width)
    #binding.pry
    table(
      [header] + data,
      width: width,
      cell_style: {
        align: :center,
        valign: :center,
        size: 11,
        border_width: 0.5,
        border_color: "F2F7FE",
        padding_bottom: 10
      }
    ) do
      cells.style do |cell|
        cell.background_color = ((cell.row) % 2).zero? ? 'd6d6d6' : 'f0f0f0'
      end

      row(0).style(
        font: 'OpenSans',
        font_style: :bold,
        text_color: "F2F7FE",
        background_color: "8E0000",
        border_color: "8E0000",
        size: 14,
        overflow: :shrink_to_fit,
        single_line: true
      )
    end
  end

  def write_footer
    repeat(:all, dynamic: true) do
      draw_text page_number, at:[550, -10]
    end
  end
end