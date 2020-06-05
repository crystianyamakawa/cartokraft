require 'test_helper'

class EntregaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega_item = entrega_items(:one)
  end

  test "should get index" do
    get entrega_items_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_item_url
    assert_response :success
  end

  test "should create entrega_item" do
    assert_difference('EntregaItem.count') do
      post entrega_items_url, params: { entrega_item: { created_by: @entrega_item.created_by, entrega_id: @entrega_item.entrega_id, obs: @entrega_item.obs, produto_id: @entrega_item.produto_id, quantidade: @entrega_item.quantidade, status: @entrega_item.status, updated_by: @entrega_item.updated_by, vl_total: @entrega_item.vl_total, vl_unitario: @entrega_item.vl_unitario } }
    end

    assert_redirected_to entrega_item_url(EntregaItem.last)
  end

  test "should show entrega_item" do
    get entrega_item_url(@entrega_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_item_url(@entrega_item)
    assert_response :success
  end

  test "should update entrega_item" do
    patch entrega_item_url(@entrega_item), params: { entrega_item: { created_by: @entrega_item.created_by, entrega_id: @entrega_item.entrega_id, obs: @entrega_item.obs, produto_id: @entrega_item.produto_id, quantidade: @entrega_item.quantidade, status: @entrega_item.status, updated_by: @entrega_item.updated_by, vl_total: @entrega_item.vl_total, vl_unitario: @entrega_item.vl_unitario } }
    assert_redirected_to entrega_item_url(@entrega_item)
  end

  test "should destroy entrega_item" do
    assert_difference('EntregaItem.count', -1) do
      delete entrega_item_url(@entrega_item)
    end

    assert_redirected_to entrega_items_url
  end
end
