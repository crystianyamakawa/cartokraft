class PedidoItemsController < ApplicationController
  before_action :set_pedido_item, only: [:show, :edit, :update, :destroy]

  # GET /pedido_items
  # GET /pedido_items.json
  def index
    @pedido_items = PedidoItem.all
  end

  # GET /pedido_items/1
  # GET /pedido_items/1.json
  def show
  end

  # GET /pedido_items/new
  def new
    @pedido_item = PedidoItem.new
  end

  # GET /pedido_items/1/edit
  def edit
  end

  # POST /pedido_items
  # POST /pedido_items.json
  def create
    @pedido_item = PedidoItem.new(pedido_item_params)

    respond_to do |format|
      if @pedido_item.save
        format.html { redirect_to @pedido_item, notice: 'Pedido item was successfully created.' }
        format.json { render :show, status: :created, location: @pedido_item }
      else
        format.html { render :new }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedido_items/1
  # PATCH/PUT /pedido_items/1.json
  def update
    respond_to do |format|
      if @pedido_item.update(pedido_item_params)
        format.html { redirect_to @pedido_item, notice: 'Pedido item was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido_item }
      else
        format.html { render :edit }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedido_items/1
  # DELETE /pedido_items/1.json
  def destroy
    @pedido_item.destroy
    respond_to do |format|
      format.html { redirect_to pedido_items_url, notice: 'Pedido item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_item
      @pedido_item = PedidoItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_item_params
      params.require(:pedido_item).permit(:pedido_id, :ds_produto, :produto_id, :vl_largura, :vl_comprimento, :vl_altura, :tp_papel, :tp_produto, :qt_pedido, :qt_produzido, :vl_custo, :vl_venda, :vl_total, :status, :obs, :dt_prevista, :dt_entrega, :dt_produzido, :created_by, :updated_by)
    end
end
