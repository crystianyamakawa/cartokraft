require 'test_helper'

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get materials_url
    assert_response :success
  end

  test "should get new" do
    get new_material_url
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post materials_url, params: { material: { area: @material.area, comprimento: @material.comprimento, created_by: @material.created_by, name: @material.name, fornecedor_id: @material.fornecedor_id, largura: @material.largura, nr_localizador: @material.nr_localizador, obs: @material.obs, status: @material.status, tp_material: @material.tp_material, updated_by: @material.updated_by } }
    end

    assert_redirected_to material_url(Material.last)
  end

  test "should show material" do
    get material_url(@material)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_url(@material)
    assert_response :success
  end

  test "should update material" do
    patch material_url(@material), params: { material: { area: @material.area, comprimento: @material.comprimento, created_by: @material.created_by, name: @material.name, fornecedor_id: @material.fornecedor_id, largura: @material.largura, nr_localizador: @material.nr_localizador, obs: @material.obs, status: @material.status, tp_material: @material.tp_material, updated_by: @material.updated_by } }
    assert_redirected_to material_url(@material)
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete material_url(@material)
    end

    assert_redirected_to materials_url
  end
end
