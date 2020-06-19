module ApplicationHelper
  def currency_to_number currency
    currency.to_s.gsub(/[$,]/,'').to_f
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name,"#",:onclick=>"remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    puts "Associacao " + association.to_s
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render association, :f => builder
    end
  link_to( name,"#", "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def parse_faturamento_data(data)
    faturamento_data[:data] = data[1]
    faturamento_data = Hash.new
    faturamento_data[:venda] = data[2]
    faturamento_data[:custo] = data[3]
    faturamento_data[:bruto] = data[4]
    faturamento_data[:despesa] = data[5]
    faturamento_data[:liquido] = data[6]
  ({ 'Data' => faturamento_data[:data],
     'Venda' => faturamento_data[:venda],
     'Custo' => faturamento_data[:custo],
     'Bruto' => faturamento_data[:bruto],
     'Despesa' => faturamento_data[:despesa],
     'Liquido' => faturamento_data[:liquido]
        })
      # //  puts faturamento_data
  end

end
