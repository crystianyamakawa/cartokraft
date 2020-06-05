require 'test_helper'

class EntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega = entregas(:one)
  end

  test "should get index" do
    get entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_url
    assert_response :success
  end

  test "should create entrega" do
    assert_difference('Entrega.count') do
      post entregas_url, params: { entrega: { cliente_id: @entrega.cliente_id, created_by: @entrega.created_by, dt_entrega: @entrega.dt_entrega, nr_notafiscal: @entrega.nr_notafiscal, obs: @entrega.obs, status: @entrega.status, updated_by: @entrega.updated_by, venda_id: @entrega.venda_id, vl_total: @entrega.vl_total } }
    end

    assert_redirected_to entrega_url(Entrega.last)
  end

  test "should show entrega" do
    get entrega_url(@entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_url(@entrega)
    assert_response :success
  end

  test "should update entrega" do
    patch entrega_url(@entrega), params: { entrega: { cliente_id: @entrega.cliente_id, created_by: @entrega.created_by, dt_entrega: @entrega.dt_entrega, nr_notafiscal: @entrega.nr_notafiscal, obs: @entrega.obs, status: @entrega.status, updated_by: @entrega.updated_by, venda_id: @entrega.venda_id, vl_total: @entrega.vl_total } }
    assert_redirected_to entrega_url(@entrega)
  end

  test "should destroy entrega" do
    assert_difference('Entrega.count', -1) do
      delete entrega_url(@entrega)
    end

    assert_redirected_to entregas_url
  end
end
