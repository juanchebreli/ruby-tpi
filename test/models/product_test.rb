require "test_helper"

class ProductTest < ActiveSupport::TestCase

  
  test 'invalid without detalle' do
    @product=Product.create(montoU:1,detalle:"asd",descripcion:"asd",codigo:"1234")
  end
end