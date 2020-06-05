class EntregaItemsController < ApplicationController
  before_action :set_entrega_item, only: [:show, :edit, :update, :destroy]

  # GET /entrega_items
  # GET /entrega_items.json
  def index
    @entrega_items = EntregaItem.all
  end

  # GET /entrega_items/1
  # GET /entrega_items/1.json
  def show
  end

  # GET /entrega_items/new
  def new
    @entrega_item = EntregaItem.new
  end

  # GET /entrega_items/1/edit
  def edit
  end

  # POST /entrega_items
  # POST /entrega_items.json
  def create
    @entrega_item = EntregaItem.new(entrega_item_params)

    respond_to do |format|
      if @entrega_item.save
        format.html { redirect_to @entrega_item, notice: 'Entrega item was successfully created.' }
        format.json { render :show, status: :created, location: @entrega_item }
      else
        format.html { render :new }
        format.json { render json: @entrega_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrega_items/1
  # PATCH/PUT /entrega_items/1.json
  def update
    respond_to do |format|
      if @entrega_item.update(entrega_item_params)
        format.html { redirect_to @entrega_item, notice: 'Entrega item was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrega_item }
      else
        format.html { render :edit }
        format.json { render json: @entrega_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrega_items/1
  # DELETE /entrega_items/1.json
  def destroy
    @entrega_item.destroy
    respond_to do |format|
      format.html { redirect_to entrega_items_url, notice: 'Entrega item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega_item
      @entrega_item = EntregaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrega_item_params
      params.require(:entrega_item).permit(:entrega_id, :produto_id, :quantidade, :vl_unitario, :vl_custo,:vl_total, :status, :obs, :created_by, :updated_by)
    end
end
