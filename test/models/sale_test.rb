require "test_helper"

class SaleTest < ActiveSupport::TestCase
  def setup
    @sale= sales(:one)
    @reservation= reservations(:one)
    @product= products(:one)
  end
  
  test 'invalid without user_id' do
    @sale.user_id= nil
    refute @sale.valid?, 'sale is valid without a user_id'
    assert_not_nil @sale.errors[:user_id], 'no validation error for user_id'
  end

  test 'invalid without client_id' do
    @sale.client_id= nil
    refute @sale.valid?, 'sale is valid without a client_id'
    assert_not_nil @sale.errors[:client_id], 'no validation error for client_id'
  end

  test 'invalid without fecha' do
    @sale.fecha= nil
    refute @sale.valid?, 'sale is valid without a fecha'
    assert_not_nil @sale.errors[:fecha], 'no validation error for fecha'
  end

  test 'add items to sale' do
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    @sale.add_items(@product.codigo,2)
    assert_equal 2, @sale.sale_items.count()
  end

  test 'monto total' do
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    @sale.add_items(@product.codigo,2)
    assert_equal (@product.montoU + @product.montoU), @sale.monto_total 
  end

  test 'cancel' do
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    @sale.add_items(@product.codigo,2)
    assert_equal 2, @sale.sale_items.count()
    @sale.cancelar
    assert_equal 0, @sale.sale_items.count()
  end

  test 'add items of reservation' do
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    Item.create(product_id: @product.id, estado: 'disponible')
    @reservation.add_items(@product.codigo,2)
    assert_equal 2, @reservation.reservation_items.count()
    @sale.add_items_reservation(@reservation.reservation_items)
    assert_equal 2, @sale.sale_items.count()
  end

end
