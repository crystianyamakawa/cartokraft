require 'test_helper'

class RecebimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recebimento = recebimentos(:one)
  end

  test "should get index" do
    get recebimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_recebimento_url
    assert_response :success
  end

  test "should create recebimento" do
    assert_difference('Recebimento.count') do
      post recebimentos_url, params: { recebimento: { created_by: @recebimento.created_by, dt_executado: @recebimento.dt_executado, dt_previsto: @recebimento.dt_previsto, fornecedor_id: @recebimento.fornecedor_id, nome: @recebimento.nome, obs: @recebimento.obs, status: @recebimento.status, tp_receita: @recebimento.tp_receita, updated_by: @recebimento.updated_by, vl_executado: @recebimento.vl_executado, vl_receita: @recebimento.vl_receita } }
    end

    assert_redirected_to recebimento_url(Recebimento.last)
  end

  test "should show recebimento" do
    get recebimento_url(@recebimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_recebimento_url(@recebimento)
    assert_response :success
  end

  test "should update recebimento" do
    patch recebimento_url(@recebimento), params: { recebimento: { created_by: @recebimento.created_by, dt_executado: @recebimento.dt_executado, dt_previsto: @recebimento.dt_previsto, fornecedor_id: @recebimento.fornecedor_id, nome: @recebimento.nome, obs: @recebimento.obs, status: @recebimento.status, tp_receita: @recebimento.tp_receita, updated_by: @recebimento.updated_by, vl_executado: @recebimento.vl_executado, vl_receita: @recebimento.vl_receita } }
    assert_redirected_to recebimento_url(@recebimento)
  end

  test "should destroy recebimento" do
    assert_difference('Recebimento.count', -1) do
      delete recebimento_url(@recebimento)
    end

    assert_redirected_to recebimentos_url
  end
end
