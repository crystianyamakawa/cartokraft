# require './lib/entrega_pdf'

class EntregasController < ApplicationController
  before_action :set_entrega, only: [:show, :edit, :update, :destroy]

  # GET /entregas
  # GET /entregas.json
  def index

    filter = ["0=0"]

    # if params.has_key?("cliente")
    #   if !params[:cliente].blank?
    #     cliente = params[:cliente]
    #     # lst_clientes = clientes.map{ |s| s.id}
    #     # puts "Lista de Clientes : " + lst_clientes.to_s
    #     # if !lst_clientes.nil?  then
    #     #
    #      filter << ["clientes.name like '%#{cliente}%'"]
    #   end
    #   if !params[:dt_entrega].blank?
    #     dt_entrega = params[:dt_entrega]
    #     filter << [ " dt_entrega = STR_TO_DATE('#{dt_entrega}', '%d/%m/%Y')"]
    #   end
    #   if !params[:status].blank?
    #     status = params[:status]
    #     filter << [ " status = '#{status}'"]
    #   end
    #
    # end

    setList
    @entregas = Entrega.all.order(:dt_entrega)
  end

  # GET /entregas/1
  # GET /entregas/1.json
  def show
    setList
    respond_to do |format|
      format.html
      format.pdf {entrega_pdf(@entrega)}

      # format.pdf do
      #   pdf = EntregaPdf.new(@entrega)
      #   send_data pdf.render, filename: "/public/entregas/#{@entrega.dt_entrega.try(:strftime,'%Y%m%d')}_#{@entrega.cliente.try(:name)}.pdf",
      #                         type: "application/pdf",
      #                         disposition: "inline"
      # end
    end

  end

  # GET /entregas/new
  def new
    setList
    @entrega = Entrega.new
    @entrega.created_by = current_user.name
    @entrega.updated_by = current_user.name
    4.times do
      item = @entrega.entrega_items.build
      item.created_by = current_user.name
      item.updated_by = current_user.name
      end

  end

  # GET /entregas/1/edit
  def edit
    setList
    @entrega.updated_by = current_user.name
  end

  # POST /entregas
  # POST /entregas.json
  def create
    @entrega = Entrega.new(entrega_params)

    respond_to do |format|
      if @entrega.save
        format.html { redirect_to @entrega, notice: 'Entrega was successfully created.' }
        format.json { render :show, status: :created, location: @entrega }
      else
        format.html { render :new }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entregas/1
  # PATCH/PUT /entregas/1.json
  def update
    respond_to do |format|
      if @entrega.update(entrega_params)
        format.html { redirect_to @entrega, notice: 'Entrega was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrega }
      else
        format.html { render :edit }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entregas/1
  # DELETE /entregas/1.json
  def destroy
    @entrega.destroy
    respond_to do |format|
      format.html { redirect_to entregas_url, notice: 'Entrega was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def entrega_pdf(entrega)
          report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'Entrega_produtos.tlf')
          # 2.times do
            if !entrega.entrega_items[0].nil? then
              item = entrega.entrega_items[0]
              nm_produto_0 = item.produto.name
              quantidade_0 = item.quantidade
              vl_unitario_0 = item.vl_unitario
              vl_total_0    = item.vl_total
            end
            if !entrega.entrega_items[1].nil? then
              item = entrega.entrega_items[1]
              nm_produto_1 = item.produto.name
              quantidade_1 = item.quantidade
              vl_unitario_1 = item.vl_unitario
              vl_total_1    = item.vl_total
            end
            if !entrega.entrega_items[2].nil? then
              item = entrega.entrega_items[2]
              nm_produto_2 = item.produto.name
              quantidade_2 = item.quantidade
              vl_unitario_2 = item.vl_unitario
              vl_total_2    = item.vl_total
            end

            if !entrega.entrega_items[3].nil? then
              item = entrega.entrega_items[3]
              nm_produto_3 = item.produto.name
              quantidade_3 = item.quantidade
              vl_unitario_3 = item.vl_unitario
              vl_total_3    = item.vl_total
            end
            report.list.add_row do |row|
              row.item(:logo).src(File.join(Rails.root, 'public', 'img', 'logo.png'))

              rua = entrega.cliente.try(:rua) << " Nº "
              rua = rua << entrega.cliente.try(:numero)
              row.values dt_entrega: entrega.dt_entrega.try(:strftime, '%d/%m/%Y'),
                         nm_cliente: entrega.cliente.try(:name),
                         rua: rua,
                         bairro: entrega.cliente.try(:bairro),
                         cidade: entrega.cliente.try(:cidade),
                         nr_cnpj_cpf: entrega.cliente.try(:nr_cpf_cnpj),
                         nm_produto_0: nm_produto_0,
                         qtd_item_0: quantidade_0,
                         vl_unitario_item_0: vl_unitario_0,
                         vl_total_item_0: vl_total_0,
                         nm_produto_1: nm_produto_1,
                         qtd_item_1: quantidade_1,
                         vl_unitario_item_1: vl_unitario_1,
                         vl_total_item_1: vl_total_1,
                         nm_produto_2: nm_produto_2,
                         qtd_item_2: quantidade_2,
                         vl_unitario_item_2: vl_unitario_2,
                         vl_total_item_2: vl_total_2,
                         nm_produto_3: nm_produto_3,
                         qtd_item_3: quantidade_3,
                         vl_unitario_item_3: vl_unitario_3,
                         vl_total_item_3: vl_total_3,
                         cond_pagto: "",
                         vl_total: entrega.try(:vl_total)

            end


          send_data report.generate, filename: "#{entrega.dt_entrega.try(:strftime, '%Y%m%d')}_#{entrega.cliente.try(:name)}_entrega.pdf",
                                     type: 'application/pdf'
  end


  def render_pdf(entrega)
          report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'Entrega_produtos.tlf')

          report.list.header.item(:logo).src(File.join(Rails.root, 'public', 'img', 'logo.png'))

          report.list.header.item(:dt_entrega).value(entrega.dt_entrega.try(:strftime, '%d/%m/%Y'))
          report.list.header.item(:nm_cliente).value(entrega.cliente.try(:name))
          rua = entrega.cliente.try(:rua) << " Nº "
          rua = rua << entrega.cliente.try(:numero)
          report.list.header.item(:rua).value(rua)
          report.list.header.item(:bairro).value(entrega.cliente.try(:bairro))
          report.list.header.item(:cidade).value(entrega.cliente.try(:cidade))
          report.list.header.item(:nr_cnpj_cpf).value(entrega.cliente.try(:nr_cpf_cnpj))

          # report.list.on_footer_insert do |footer|
          #     footer.item(:cond_pagto).value('15 dias')
          #     footer.item(:vl_total).value(entrega.try(:vl_total))
          #
          # end

          entrega.entrega_items.each do |item|
            report.list.add_row do |row|
                row.values nm_produto: item.produto.name,
                           qtd_item: item.quantidade,
                           vl_unitario_item: item.vl_unitario,
                           vl_total_item: item.vl_total
                #     row.item(:name).style(:color, 'red') unless task.done?
            end
          end
          send_data report.generate, filename: 'entrega.pdf',
                                     type: 'application/pdf'
  end



  def update_produtos
    @produtos = Produto.where("cliente_id = ?", params[:cliente_id])
   # respond_to do |format|
   #      format.js
   #  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega
      @entrega = Entrega.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrega_params
      params.require(:entrega).permit(:venda_id, :cliente_id, :vl_total, :status, :dt_entrega, :dt_faturamento, :receipt_id, :obs,
                                      :nr_notafiscal, :created_by, :updated_by ,
                                       entrega_items_attributes: [:id, :entrega_id, :produto_id, :quantidade,
                                                                 :vl_unitario, :vl_total,:status,:obs, :created_by,
                                                                 :updated_by, :_destroy]
                                                                )
    end
    def setList
      @clientes = Cliente.order('name ASC')
      @produtos = Produto.order('name ASC')
      @status = ["Aguardando Produção","A Entregar", "Entregue", "Entrega Cancelada", "CARTOPAR"]
      # @contratos = Contrato.order("dt_evento ASC")
    end
end
