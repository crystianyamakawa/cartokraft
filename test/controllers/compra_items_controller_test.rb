require 'test_helper'

class CompraItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compra_item = compra_items(:one)
  end

  test "should get index" do
    get compra_items_url
    assert_response :success
  end

  test "should get new" do
    get new_compra_item_url
    assert_response :success
  end

  test "should create compra_item" do
    assert_difference('CompraItem.count') do
      post compra_items_url, params: { compra_item: { compra_id: @compra_item.compra_id, created_by: @compra_item.created_by, obs: @compra_item.obs, produto_id: @compra_item.produto_id, quantidade: @compra_item.quantidade, status: @compra_item.status, updated_by: @compra_item.updated_by, vl_total: @compra_item.vl_total, vl_unitario: @compra_item.vl_unitario } }
    end

    assert_redirected_to compra_item_url(CompraItem.last)
  end

  test "should show compra_item" do
    get compra_item_url(@compra_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_compra_item_url(@compra_item)
    assert_response :success
  end

  test "should update compra_item" do
    patch compra_item_url(@compra_item), params: { compra_item: { compra_id: @compra_item.compra_id, created_by: @compra_item.created_by, obs: @compra_item.obs, produto_id: @compra_item.produto_id, quantidade: @compra_item.quantidade, status: @compra_item.status, updated_by: @compra_item.updated_by, vl_total: @compra_item.vl_total, vl_unitario: @compra_item.vl_unitario } }
    assert_redirected_to compra_item_url(@compra_item)
  end

  test "should destroy compra_item" do
    assert_difference('CompraItem.count', -1) do
      delete compra_item_url(@compra_item)
    end

    assert_redirected_to compra_items_url
  end
end
