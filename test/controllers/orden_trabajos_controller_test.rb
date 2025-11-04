require "test_helper"

class OrdenTrabajosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_trabajo = orden_trabajos(:one)
  end

  test "should get index" do
    get orden_trabajos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_trabajo_url
    assert_response :success
  end

  test "should create orden_trabajo" do
    assert_difference("OrdenTrabajo.count") do
      post orden_trabajos_url, params: { orden_trabajo: { cam10: @orden_trabajo.cam10, cam12: @orden_trabajo.cam12, cam24: @orden_trabajo.cam24, clinom: @orden_trabajo.clinom, colores: @orden_trabajo.colores, deadline: @orden_trabajo.deadline, estado: @orden_trabajo.estado, estado_actual: @orden_trabajo.estado_actual, fecentr: @orden_trabajo.fecentr, gramaje: @orden_trabajo.gramaje, nomprod: @orden_trabajo.nomprod, observaciones: @orden_trabajo.observaciones, papel: @orden_trabajo.papel, pliego: @orden_trabajo.pliego, priority: @orden_trabajo.priority, procesos: @orden_trabajo.procesos, trcan: @orden_trabajo.trcan, trcar: @orden_trabajo.trcar, trnum: @orden_trabajo.trnum } }
    end

    assert_redirected_to orden_trabajo_url(OrdenTrabajo.last)
  end

  test "should show orden_trabajo" do
    get orden_trabajo_url(@orden_trabajo)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_trabajo_url(@orden_trabajo)
    assert_response :success
  end

  test "should update orden_trabajo" do
    patch orden_trabajo_url(@orden_trabajo), params: { orden_trabajo: { cam10: @orden_trabajo.cam10, cam12: @orden_trabajo.cam12, cam24: @orden_trabajo.cam24, clinom: @orden_trabajo.clinom, colores: @orden_trabajo.colores, deadline: @orden_trabajo.deadline, estado: @orden_trabajo.estado, estado_actual: @orden_trabajo.estado_actual, fecentr: @orden_trabajo.fecentr, gramaje: @orden_trabajo.gramaje, nomprod: @orden_trabajo.nomprod, observaciones: @orden_trabajo.observaciones, papel: @orden_trabajo.papel, pliego: @orden_trabajo.pliego, priority: @orden_trabajo.priority, procesos: @orden_trabajo.procesos, trcan: @orden_trabajo.trcan, trcar: @orden_trabajo.trcar, trnum: @orden_trabajo.trnum } }
    assert_redirected_to orden_trabajo_url(@orden_trabajo)
  end

  test "should destroy orden_trabajo" do
    assert_difference("OrdenTrabajo.count", -1) do
      delete orden_trabajo_url(@orden_trabajo)
    end

    assert_redirected_to orden_trabajos_url
  end
end
