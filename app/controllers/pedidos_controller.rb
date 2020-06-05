class PedidosController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    filter = ["0=0"]
    if params.has_key?("cliente")
      if !params[:cliente].blank?
        nmcliente = params[:cliente]
        filter << [" nm_cliente like '%#{nmcliente}'%"]
      end
      if !params[:status].blank?
        status = params[:status]
        filter << [ " status LIKE '%#{status}%'"]
      end
    end
    @pedidos = Pedido.where(filter.join(" And ")).paginate(:page => params[:page], :per_page =>15 )
    setList

  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    setList

  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    # @pedido.created_by = current_user.username
    # @pedido.updated_by = current_user.username

    setList
  end

  # GET /pedidos/1/edit
  def edit
    setList
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
    # @pedido.updated_by = current_user.username

  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:nm_cliente, :cliente_id, :vl_pedido,
                     :status, :dt_prevista, :obs, :created_by, :updated_by,
                     :ds_produto, :produto_id,:vl_largura, :vl_comprimento,
                     :vl_altura, :tp_papel,:tp_produto,:qt_pedido,
                     :qt_produzido,:vl_custo,:vl_venda, :vl_total_pedido,
                     :vl_total_venda, :dt_entrega, :entrega_id,
                     :dt_produzido, :dt_fechamento)
    end

    def setList
      @clientes = Cliente.order('name ASC')
      @produtos = Produto.order('name ASC')
      @status = ["Orçamento","Pedido", "Em Produção", "Produzido", "Entregue"]
      @tp_papel = ["Papel Simples","Papel Duplo","Papel Branco", "Onda T"]
      @tp_produto = ["Caixa Maleta","Corte e Vinco","Fundo e Tampa","Especial"]
      # @contratos = Contrato.order("dt_evento ASC")
    end

end
