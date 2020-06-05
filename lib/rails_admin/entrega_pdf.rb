module RailsAdminPdf
end

require 'rails_admin/config/actions'
require 'prawn'
require 'gruff'

module RailsAdmin
  module Config
    module Actions
      class Pdf < Base
        RailsAdmin::Config::Actions.register(self)

          register_instance_option :member do
            true
          end

          register_instance_option :pjax? do
            false
          end

          register_instance_option :controller do
            Proc.new do
              # Configurando PDF
              PDF_OPTIONS = { :page_size => "A4",
              :page_layout => :portrait,
              :margin      => [40, 75]
              }



              Prawn::Document.new(PDF_OPTIONS) do |pdf|

                header_data  = ([[{:image => "public/img/logo_pin.png"},""],
                              # ["CARTOKRAFT EMBALAGENS", "" ],
                              ["ROMANEIO DE ENTREGAS", " 1ª Via - Cliente"]])
                pdf.table(header_data, :column_widths => [295, 150])


                cliente_data  = ([["DATA",         @object.try(:dt_entrega)],
                         ["DESTINATÁRIO", @object.cliente.try(:name)],
                         ["CNPJ/CPF",     @object.cliente.try(:nr_cpf_cnpj)],
                         ["ENDEREÇO",     @object.cliente.try(:rua) +  " Nº " + @object.cliente.try(:numero) + ", " + @object.cliente.try(:bairro)],
                         ["CIDADE" ,      @object.cliente.try(:cidade)]])

                pdf.table(cliente_data, :column_widths => [100, 345], :cell_style => {:border_botton_color => "FFFFFF",:border_top_color =>"FFFFFF"})

                vl_total_romaneiro = 0
                item_data =([["Produto","Qtd","Vl. Unit.", "Vl. Item"]])

                 @object.entrega_items.each do |item|
                   vl_total_romaneiro = vl_total_romaneiro + item.vl_total
                   item_data <<[item.produto.name, item.quantidade.to_s,item.vl_unitario.to_s, item.vl_total.to_s]
                   puts item_data
                   pdf.table(item_data, :column_widths => [280, 45,60,60])
                 end

                footer_data =([["OBS", vl_total_romaneiro.to_s]])
                pdf.table(footer_data, :column_widths => [385,60])


                # pdf.bounding_box([0, 610], :width => 480, :height => 80) do
                #   pdf.stroke_bounds
                #   @object.entrega_items.each do |item|
                #     pdf.move_down 2
                #     pdf.text "#{item.produto.name}                                                                #{item.quantidade}       #{item.vl_unitario}      #{item.vl_total} ",
                #                     :size => 12, :style => :bold, :align => :left
                #   end
                # end


                # pdf.bounding_box([5, 20], :width => 530, :height => 320) do
                #   pdf.stroke_bounds
                #   pdf.move_down 1
                #   pdf.text "DATA: #{@object.try(:dt_entrega)} ", :size => 12, :style => :bold, :align => :left
                #   pdf.text "DESTINATÁRIO: #{@object.cliente.try(:name)} ", :size => 12, :align => :left
                # end

                pdf.move_down 80
                header_data  = ([["CARTOKRAFT EMBALAGENS", "" ],
                              ["ROMANEIO DE ENTREGAS", " 2ª Via - Expedição"]])
                pdf.table(header_data, :column_widths => [345, 100])
                pdf.table(cliente_data, :column_widths => [100, 345])
                pdf.table(item_data, :column_widths => [280, 45,60,60])
                footer_data =([["Assinatura", vl_total_romaneiro.to_s],
                               ["________________________________________",""]   ])
                pdf.table(footer_data, :column_widths => [385,60])

                pdf.start_new_page
                header_data  = ([["CARTOKRAFT EMBALAGENS", "" ],
                              ["ROMANEIO DE ENTREGAS", " 3ª Via - Copia"]])
                pdf.table(header_data, :column_widths => [345, 100])
                pdf.table(cliente_data, :column_widths => [100, 345])
                pdf.table(item_data, :column_widths => [280, 45,60,60])
                footer_data =([["",""],
                               ["Assinatura                                ________________________________________", vl_total_romaneiro.to_s],
                               ["",""]   ])
                pdf.table(footer_data, :column_widths => [385,60])


                # Muda de font para Helvetica
                pdf.font "Helvetica"
                # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
                # pdf.text "Link Para o Manul do Prawn<link href='http://prawnpdf.org/manual.pdf'> <color rgb='5ca3e6'>clicável</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
                # # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
                # pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
                # # Gera no nosso PDF e coloca na pasta public com o name agreement.pdf
                pdf.render_file('public/romaneiro.pdf')

                File.open("public/romaneiro.pdf", 'r') do |f|
                   send_data f.read.force_encoding('BINARY'), :filename => 'pdf', :type => "application/pdf", :disposition => "attachment"
                end
                # File.delete("public/#{ramdom_file_name}.pdf")
                # File.delete("public/graph.jpg") if @object.sales.count  0
                end
            end
          end
              register_instance_option :link_icon do
                'fa fa-file-pdf-o'
              end
            end
          end
        end
      end

      # def print_layout
      #   # logo = open("http://cartokraft.com.br/admkraft/img/logo.png")
      #   bounding_box([0, 700], :width => 530, :height => 320) do
      #     stroke_bounds
      #     define_grid(:columns => 2, :rows => 1)
      #     grid([0, 0],[0,1]).bounding_box do
      #       # print_header
      #     end
      #   end
      # end



  # def print_header
  #   move_down 40
  #   bounding_box([20,640], :width=> 60, :height => 50  ) do
  #     text "DATA    :"
  #     text "CLIENTE :"
  #     text "ENDEREÇO:"
  #     text "BAIRRO  :"
  #     text "CNPJ/CPF:"
  #   end
  #   bounding_box([70,640], :width=> 60, :height => 50  ) do
  #     text "DATA    :"
  #     text "CLIENTE :"
  #     text "ENDEREÇO:"
  #     text "BAIRRO  :"
  #     text "CNPJ/CPF:"
  #   end
  #
  # end
  #
  # def print_itens
  #   move_down 20
  #   text "items"
  # end
  #
  # def print_footer
  #   move_down 15
  #   text "Total Price: ", size: 16, style: :bold
  # end
# end
