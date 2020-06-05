require 'test_helper'

class ComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compra = compras(:one)
  end

  test "should get index" do
    get compras_url
    assert_response :success
  end

  test "should get new" do
    get new_compra_url
    assert_response :success
  end

  test "should create compra" do
    assert_difference('Compra.count') do
      post compras_url, params: { compra: { created_by: @compra.created_by, descricao: @compra.descricao, dt_recebimento: @compra.dt_recebimento, fornecedor_id: @compra.fornecedor_id, obs: @compra.obs, status: @compra.status, updated_by: @compra.updated_by, vl_total: @compra.vl_total } }
    end

    assert_redirected_to compra_url(Compra.last)
  end

  test "should show compra" do
    get compra_url(@compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_compra_url(@compra)
    assert_response :success
  end

  test "should update compra" do
    patch compra_url(@compra), params: { compra: { created_by: @compra.created_by, descricao: @compra.descricao, dt_recebimento: @compra.dt_recebimento, fornecedor_id: @compra.fornecedor_id, obs: @compra.obs, status: @compra.status, updated_by: @compra.updated_by, vl_total: @compra.vl_total } }
    assert_redirected_to compra_url(@compra)
  end

  test "should destroy compra" do
    assert_difference('Compra.count', -1) do
      delete compra_url(@compra)
    end

    assert_redirected_to compras_url
  end
end
