require 'test_helper'

class PedidoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido_item = pedido_items(:one)
  end

  test "should get index" do
    get pedido_items_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_item_url
    assert_response :success
  end

  test "should create pedido_item" do
    assert_difference('PedidoItem.count') do
      post pedido_items_url, params: { pedido_item: { created_by: @pedido_item.created_by, ds_produto: @pedido_item.ds_produto, dt_entrega: @pedido_item.dt_entrega, dt_prevista: @pedido_item.dt_prevista, dt_produzido: @pedido_item.dt_produzido, obs: @pedido_item.obs, pedido_id: @pedido_item.pedido_id, produto_id: @pedido_item.produto_id, qt_pedido: @pedido_item.qt_pedido, qt_produzido: @pedido_item.qt_produzido, status: @pedido_item.status, tp_papel: @pedido_item.tp_papel, tp_produto: @pedido_item.tp_produto, updated_by: @pedido_item.updated_by, vl_altura: @pedido_item.vl_altura, vl_comprimento: @pedido_item.vl_comprimento, vl_custo: @pedido_item.vl_custo, vl_largura: @pedido_item.vl_largura, vl_total: @pedido_item.vl_total, vl_venda: @pedido_item.vl_venda } }
    end

    assert_redirected_to pedido_item_url(PedidoItem.last)
  end

  test "should show pedido_item" do
    get pedido_item_url(@pedido_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_item_url(@pedido_item)
    assert_response :success
  end

  test "should update pedido_item" do
    patch pedido_item_url(@pedido_item), params: { pedido_item: { created_by: @pedido_item.created_by, ds_produto: @pedido_item.ds_produto, dt_entrega: @pedido_item.dt_entrega, dt_prevista: @pedido_item.dt_prevista, dt_produzido: @pedido_item.dt_produzido, obs: @pedido_item.obs, pedido_id: @pedido_item.pedido_id, produto_id: @pedido_item.produto_id, qt_pedido: @pedido_item.qt_pedido, qt_produzido: @pedido_item.qt_produzido, status: @pedido_item.status, tp_papel: @pedido_item.tp_papel, tp_produto: @pedido_item.tp_produto, updated_by: @pedido_item.updated_by, vl_altura: @pedido_item.vl_altura, vl_comprimento: @pedido_item.vl_comprimento, vl_custo: @pedido_item.vl_custo, vl_largura: @pedido_item.vl_largura, vl_total: @pedido_item.vl_total, vl_venda: @pedido_item.vl_venda } }
    assert_redirected_to pedido_item_url(@pedido_item)
  end

  test "should destroy pedido_item" do
    assert_difference('PedidoItem.count', -1) do
      delete pedido_item_url(@pedido_item)
    end

    assert_redirected_to pedido_items_url
  end
end
