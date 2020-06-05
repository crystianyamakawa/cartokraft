class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    setList
  end

  # GET /produtos/new
  def new
    setList
    @produto = Produto.new
    @produto.created_by = current_user.name
    @produto.updated_by = current_user.name

  end

  # GET /produtos/1/edit
  def edit
    setList
    @produto.updated_by = current_user.name

  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:name, :nr_localizador, :status, :area, :largura, :comprimento, :tp_material,
       :fornecedor_id,
      :obs, :created_by, :updated_by, :cliente_id,:material_id, :vl_venda, :vl_custo, :altura,:perda,:qt_chapa)
    end

    def setList
      @clientes = Cliente.order('name ASC')
      @material = Material.order('name ASC')
      @status = ["Ativo","Inativo"]
      # @contratos = Contrato.order("dt_evento ASC")
    end
end
