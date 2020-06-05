require 'test_helper'

class VendaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda_item = venda_items(:one)
  end

  test "should get index" do
    get venda_items_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_item_url
    assert_response :success
  end

  test "should create venda_item" do
    assert_difference('VendaItem.count') do
      post venda_items_url, params: { venda_item: { created_by: @venda_item.created_by, obs: @venda_item.obs, produto_id: @venda_item.produto_id, quantidade: @venda_item.quantidade, status: @venda_item.status, updated_by: @venda_item.updated_by, venda_id: @venda_item.venda_id, vl_total: @venda_item.vl_total, vl_unitario: @venda_item.vl_unitario } }
    end

    assert_redirected_to venda_item_url(VendaItem.last)
  end

  test "should show venda_item" do
    get venda_item_url(@venda_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_item_url(@venda_item)
    assert_response :success
  end

  test "should update venda_item" do
    patch venda_item_url(@venda_item), params: { venda_item: { created_by: @venda_item.created_by, obs: @venda_item.obs, produto_id: @venda_item.produto_id, quantidade: @venda_item.quantidade, status: @venda_item.status, updated_by: @venda_item.updated_by, venda_id: @venda_item.venda_id, vl_total: @venda_item.vl_total, vl_unitario: @venda_item.vl_unitario } }
    assert_redirected_to venda_item_url(@venda_item)
  end

  test "should destroy venda_item" do
    assert_difference('VendaItem.count', -1) do
      delete venda_item_url(@venda_item)
    end

    assert_redirected_to venda_items_url
  end
end
